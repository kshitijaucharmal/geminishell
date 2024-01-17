# Maintainer: Kshitij Aucharmal <kshitijaucharmal21@gmail.com>
pkgname='geminishell'
pkgver=1
pkgrel=1
pkgdesc="Supercharge your terminal with the power of AI"
arch=('x86_64')
url="https://github.com/kshitijaucharmal/Gemini-Shell"
license=('Apache')
depends=('python>=3.9.0')
makedepends=('git')
source=('$pkgname::git://github.com/kshitijaucharmal/Gemini-Shell')
md5sums=('SKIP')

build() {
    cd "$srcdir"
    python3 -m venv "$pkgname-venv"
    source "$pkgname-venv/bin/activate"

    pip install -e requirements.txt
    pip install pyinstaller

    pyinstaller "$pkgname/__main__.py" --clean -n "$pkgname" --distpath target
    deactivate

    cp -r * "$pkgdir/usr/lib/$pkgname"
}

package(){
    mkdir -p "$pkgdir/usr/lib/$pkgname"
}

post_package(){
    install -Dm755 $pkgdir/usr/lib/$pkgname/target/$pkgname/__main__.py /usr/bin/geminishell
}
