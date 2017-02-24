<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'docker');

/** MySQL database username */
define('DB_USER', 'docker');

/** MySQL database password */
define('DB_PASSWORD', 'docker');

/** MySQL hostname */
define('DB_HOST', 'db');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('WP_HOME', 'http://' . $_SERVER['HTTP_HOST']);
define('WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST']);

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '0x )Q=t^fJ(6r_4/mBhw?O@~*Ay<<&jFL(iv-hD%UOq[ X35w_?|wMc|Y>rFN3fS');
define('SECURE_AUTH_KEY',  ';^_ !q^41MK!F#h9`dw!s~^91}}H/|MSvj,F9Qpudyb!ffc&wz PK5NL50Vj,s[2');
define('LOGGED_IN_KEY',    '-OeIhAQnjAat{T}r_>W?2^gi]??,F$PFYQH>S0LvGsv-=Su,?eO49G&%Fpr,o0o:');
define('NONCE_KEY',        '4y!]sA$=d:OGuh,Zzq;u_@Nk~q0pXbcp[:)#|X7Quc&82(H84JbPD0bV#Q<9H6nx');
define('AUTH_SALT',        '&{tS+jz LibwTUe=z{MCP-VdMlCA,UJv/}Q_kH^$,yd$:n1gK0%:Rw)lxQ3W<>Ug');
define('SECURE_AUTH_SALT', 'ywtE0DXt8YI@s6{0k!E S1s?g0m8bJ8;]1KyVMU)bX}e53N]~lUC`^LAfwA5kx?q');
define('LOGGED_IN_SALT',   '^A>O9FW/sJG5=~rgyL(!bm4#JNY%=MnjB`^q[rF50MwF1sbk8%#ip{GIJ0=BONcg');
define('NONCE_SALT',       '7Rny:I.vp6b~IY4L,X5Fbp6i!X6czGf?JBJi0I[%gjfbd:la kN/hoHSE]>%:#2n');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
