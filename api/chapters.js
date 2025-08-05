const fs = require('fs');
const path = require('path');

// 简单的HTTP服务器
const http = require('http');
const url = require('url');

const server = http.createServer((req, res) => {
    // 设置CORS头
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Content-Type', 'application/json; charset=utf-8');
    
    const parsedUrl = url.parse(req.url, true);
    
    if (parsedUrl.pathname === '/chapters' && req.method === 'GET') {
        try {
            const chaptersDir = path.join(__dirname, '../chapters');
            const chapters = [];
            
            if (fs.existsSync(chaptersDir)) {
                const files = fs.readdirSync(chaptersDir);
                
                files.forEach(file => {
                    if (path.extname(file) === '.md') {
                        const match = file.match(/第(\d+)章_(.+)\.md/);
                        if (match) {
                            const chapterNum = parseInt(match[1]);
                            const chapterTitle = match[2];
                            
                            chapters.push({
                                number: chapterNum,
                                title: chapterTitle,
                                filename: file,
                                path: `chapters/${file}`
                            });
                        }
                    }
                });
            }
            
            // 按章节号排序
            chapters.sort((a, b) => a.number - b.number);
            
            res.end(JSON.stringify({
                success: true,
                chapters: chapters,
                total: chapters.length
            }));
            
        } catch (error) {
            res.statusCode = 500;
            res.end(JSON.stringify({
                success: false,
                error: error.message
            }));
        }
    } else {
        res.statusCode = 404;
        res.end(JSON.stringify({
            success: false,
            error: 'Not Found'
        }));
    }
});

const PORT = 3001;
server.listen(PORT, () => {
    console.log(`章节API服务器运行在 http://localhost:${PORT}`);
});