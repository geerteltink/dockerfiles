<?php

//use \PDO;

try {
    $dbh = new PDO('mysql:host=db;dbname=docker', 'docker', 'docker');
} catch (Exception $e) {
    $dbError = $e->getMessage();
}

$extensions = [
    'curl',
    'gd',
    'intl',
    'mcrypt',
    'pdo_mysql',
    'pdo_sqlite',
    'xdebug',
    'zend opcache'
];

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Docker Web Development Stack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
    <!-- Place favicon.ico in the root directory -->

    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/united/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <header role="navigation" class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="navbar-brand">Docker Web Development Stackk</a>
            </div>
        </div>
    </header>

    <main id="main" class="container" role="main">
        <h1>It works :-)</h1>
        <p class="lead">The Virtual Machine is up and running, yay! Here's some additional information you might need.</p>

        <h2>Installed software</h2>
        <table class="table table-striped">
            <tr>
                <td>Web Server</td>
                <td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
            </tr>
            <tr>
                <td>PHP Version</td>
                <td><?php echo phpversion(); ?></td>
            </tr>
            <tr>
                <td>MySQL version</td>
                <td>
                    <?php if (isset($dbh)) : ?>
                        <?php echo $dbh->getAttribute(PDO::ATTR_SERVER_VERSION); ?>
                    <?php else : ?>
                        <span class="label label-danger">
                            <?php echo $dbError; ?>
                        </span>
                    <?php endif; ?>
                </td>
            </tr>
        </table>

        <h2>PHP Modules</h2>
        <div style="-webkit-column-count:4;">
            <?php foreach ($extensions as $key => $extension) : ?>
                <div>
                    <?php if (extension_loaded($extension)) : ?>
                        <span class="label label-success">
                            <i class="glyphicon glyphicon-ok"></i> &nbsp; <?php echo $extension; ?> <?php echo phpversion($extension); ?>
                        </span>
                    <?php else : ?>
                        <span class="label label-danger">
                            <i class="glyphicon glyphicon-remove"></i> &nbsp; <?php echo $extension; ?>
                        </span>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>

        <h2>Docs</h2>
        <div style="-webkit-column-count:4;">
            <div>
                <a href="https://github.com/xtreamwayz/vagrant-devbox/blob/master/readme.md">
                    DevBox
                </a>
            </div>
            <div>
                <a href="https://github.com/xtreamwayz/vagrant-puppet/blob/master/readme.md">
                    Puppet
                </a>
            </div>
            <div>
                <a href="https://xtreamwayz.github.io/blog/git-worklow/">
                    Git workflow
                </a>
            </div>
        </div>
    </main>

    <footer class="container">
        <hr />
        <p class="text-center">
            Maintained by <a href="https://twitter.com/xtreamwayz">@xtreamwayz</a>
        </p>
    </footer>

    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>
