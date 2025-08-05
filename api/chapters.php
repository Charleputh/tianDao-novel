<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

// 章节目录路径
$chaptersDir = '../chapters/';

// 获取所有章节文件
$chapters = [];
if (is_dir($chaptersDir)) {
    $files = scandir($chaptersDir);
    
    foreach ($files as $file) {
        if (pathinfo($file, PATHINFO_EXTENSION) === 'md') {
            // 解析章节信息
            if (preg_match('/第(\d+)章_(.+)\.md/', $file, $matches)) {
                $chapterNum = intval($matches[1]);
                $chapterTitle = $matches[2];
                
                $chapters[] = [
                    'number' => $chapterNum,
                    'title' => $chapterTitle,
                    'filename' => $file,
                    'path' => 'chapters/' . $file
                ];
            }
        }
    }
}

// 按章节号排序
usort($chapters, function($a, $b) {
    return $a['number'] - $b['number'];
});

// 返回JSON数据
echo json_encode([
    'success' => true,
    'chapters' => $chapters,
    'total' => count($chapters)
], JSON_UNESCAPED_UNICODE);
?>