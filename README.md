# CCLicenseプラグイン

[Creative Commons License(CCL)](http://creativecommons.org/)のURLや画像をバージョンに応じて変更するプラグイン。

## 更新履歴

 * 0.01(2005.06.08):
   * そろそろ3.17がリリースされる頃ですが、アップデートのたびにMT本体を修正するのがマンドクセーと思ったのでやっつけで作成&公開。
 * 0.02(2005.06.13):
   * 3.16以降でCCLを改めて設定すると、プラグインが機能しないバグがあったので修正。

## 概要

MTBlogCCLicenseURL, MTBlogCCLicenseImage, MTCCLicenseRDFタグはCCLのCommons Deed(コモンズ証)を表示する目的で使用されます。しかし、標準ではCCLバージョン1.0に基づいたURLやRDFを出力するため、2.X以降のライセンスやローカライズされたライセンスを表示するにはMovable Type本体への修正が必要でした。

 /!\ MT 3.16以降ではCCLを再設定すると2.5のライセンスが設定されるようになっています。したがって、(1)2.5以外のライセンスを表示したい、(2)ローカライズされたライセンスを表示したい、(3)古いMTBlogCCLicenseImageを使用したい、のいずれかに該当しない場合にはこのプラグインを利用する必要はありません。念のため。

CCLicense Pluginはプログラム本体への修正なしに著作者が望むCommons Deedを表示するためのプラグインです。このプラグインをインストールして再構築するだけでMTBlogCCLicenseURL, MTBlogCCLicenseImage, MTCCLicenseRDFタグの出力内容がバージョンに応じたものになります。テンプレートへの修正は一切不要です。

## インストール方法

テストが不十分ですが、MT 3.0以降で動作します(と想像されます)。

CCLicense.zipに含まれるCCLicense.plをプラグインディレクトリーにコピーします。正しくインストールが完了すれば、メインメニューの「利用可能なプラグインの設定」にCCLicense Pluginが表示されるはずです。

## 使い方・カスタマイズ方法

プラグインをインストールした状態で再構築すると、MTBlogCCLicenseURL, MTBlogCCLicenseImage, MTCCLicenseRDFの出力内容が指定したCCLのバージョンになります。

デフォルトではCCLバージョン2.5のCommons Deedを出力します。これをカスタマイズするにはプラグイン中の変数を書き換えます。

 * $CCL_VERSION (Default '2.5'): CCLのバージョンを変更するにはこの変数を書き換えます。
 * $CCL_LANG (Default ''): CCLのローカライズドバージョン(URLの末尾にjpなどの国識別子が付きます)を指定するにはこの変数を書き換えます。デフォルトでは''でローカライズドバージョンを指定していません。
 * $USE_CCL2_IMG (Default 0): MTBlogCCLicenseImageが出力するCommons Deed表示用の画像をCCLバージョン2以降用のものにするかどうかを選択します。デフォルトでは1.0用のオリジナルのものを表示します。

### カスタマイズ例

例えば、以下のようにプラグインで設定しておくと、

    my $CCL_VERSION = '2.1';
    my $CCL_LANG = 'jp';

2.1の日本語ローカライズドバージョンのCommons Deedを表示することができます。

    http://creativecommons.org/licenses/by-nc-sa/2.1/jp/

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2005, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
