<form method="POST">
    <input type="password" name="pwd" required />
    <input type="submit"/>
</form>
<?php
define('URL', 'https://api.pwnedpasswords.com/range/');
if(isset($_POST['pwd'])) {
    $sha1pass = strtoupper(sha1($_POST['pwd']));
    $headSha = substr($sha1pass, 0, 5);
    $tailSha = substr($sha1pass, 5, 39);
    $check = file_get_contents(URL.$headSha);
    $hashes = [];
    $lines = explode("\n", $check);
    foreach($lines as $line) {
        $hash = explode(':', $line);
        $hashes[$hash[0]] = $hash[1];
    }
    if(isset($hashes[$tailSha])) {
        echo 'Found occurences : '.$hashes[$tailSha];
    } else {
        echo 'Not found in haveibeenpwned.com database';
    }
    echo '<br />';
}
?>
