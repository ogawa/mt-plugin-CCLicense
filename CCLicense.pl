# CCLicense Plugin for version-conscious CCLicense tags
#
# Release 0.01 (Jun 08, 2005)
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2005 Hirotaka Ogawa

package MT::Plugin::CCLicense;
use strict;

my $CCL_VERSION = '2.5';
my $CCL_LANG = '';
my $USE_CCL2_IMG = 0; # If you want to use CCL2 image, set this to "1"

eval {
    require MT::Plugin;
    my $plugin = new MT::Plugin();
    $plugin->name("CCLicense Plugin 0.01");
    $plugin->description("CCLicense tags for CCL version $CCL_VERSION" .
			 ($CCL_LANG ? "/$CCL_LANG" : ""));
    MT->add_plugin($plugin);
};

use MT::Util;
use MT::Template::Context;
{
    local $SIG{__WARN__} = sub { };
    *MT::Util::cc_url = \&_cc_url;
    *MT::Template::Context::_hdlr_blog_cc_license_image = \&_cc_img_url;
}

sub _cc_url {
    my $cc = $_[0] or return;
    my ($code, $cc_url, $cc_img_url) = $cc =~ /(\S+) (\S+) (\S+)/;
    return $cc_url if $cc_url;
    $cc eq 'pd' ?
	"http://web.resource.org/cc/PublicDomain" :
	"http://creativecommons.org/licenses/$cc/$CCL_VERSION/" .
	($CCL_LANG ? "$CCL_LANG/" : "");
}

sub _cc_img_url {
    require MT::Blog;
    my $cc = $_[0]->stash('blog')->cc_license or return;
    my ($code, $cc_url, $cc_img_url) = $cc =~ /(\S+) (\S+) (\S+)/;
    return $cc_img_url if $cc_img_url;
    "http://creativecommons.org/images/public/" .
	($cc eq 'pd' ? 'norights.gif' :
	 ($USE_CCL2_IMG ? 'somerights20.gif' : 'somerights.gif'));
}

1;
