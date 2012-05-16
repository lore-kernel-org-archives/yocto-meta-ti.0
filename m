Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE133E01408
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 17:11:54 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4300KPN9VBIJ40@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 15 May 2012 19:11:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3EBF4201B8; Tue,
	15 May 2012 20:11:34 -0400 (EDT)
Date: Tue, 15 May 2012 20:11:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20120516001134.GL14763@denix.org>
References: <1336704080-23643-1-git-send-email-denis@denix.org>
	<F63AF365-5587-4FDC-A8CC-F47BD2E01DB8@dominion.thruhere.net>
	<CAMKF1spefVF84MbRzjgjwKk71dwGP5FcUH5+RsbnCBFLHfO81A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1spefVF84MbRzjgjwKk71dwGP5FcUH5+RsbnCBFLHfO81A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 00:11:55 -0000
X-Groupsio-MsgNum: 1121
Content-type: multipart/mixed; boundary=WIyZ46R2i8wDzkSu
Content-disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2012 at 06:21:12PM -0700, Khem Raj wrote:
> On Thu, May 10, 2012 at 11:46 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> >
> > Op 11 mei 2012, om 04:41 heeft Denys Dmytriyenko het volgende geschreve=
n:
> >
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> BeagleBone kernel is required to be built in Thumb2 mode for fast boot.
> >> Gold linker is not yet perfect for this, giving an internal error:
> >>
> >> | arm-linux-gnueabi-ld: internal error in thumb_branch_common, at .../=
binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149
> >>
> >> While this fix can be put in generic linux.inc for all the kernels, it=
's
> >> better to test the Gold linker out as much as possible and only disabl=
e it
> >> for known issues, like this one (until it gets fixed, of course).
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > Looks good to me.
>=20
> OK here is blind shot. Try this binutils patch and let me know if it help=
s.
>=20
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/go=
ld&id=3Db72f3238ad32ab420306a0226d8c2e57c52ddf45

No luck - it now just segfaults where it used to give an internal error:

 arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/OE=
/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ker=
nel/.printk.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(printk)" -D"KBUILD_MO=
DNAME=3DKBUILD_STR(printk)" -c -o kernel/.tmp_printk.o kernel/printk.c

/bin/sh: line 1: 13513 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o kernel/printk.o kernel/.tmp_printk.o -T kernel/.tmp_printk.ver
make[1]: *** [kernel/printk.o] Error 139


The contents of .tmp_printk.ver:

__crc_oops_in_progress =3D 0xb1c3a01a ;
__crc_console_drivers =3D 0x0fc34a55 ;
__crc_console_set_on_cmdline =3D 0x2459bbcc ;
__crc_printk =3D 0x27e1a049 ;
__crc_vprintk =3D 0xbf8ba54a ;
__crc_console_suspend_enabled =3D 0xfedd35fc ;
__crc_console_lock =3D 0xfbaaf01e ;
__crc_console_trylock =3D 0x40d04664 ;
__crc_console_unlock =3D 0xc631580a ;
__crc_console_conditional_schedule =3D 0xbef43296 ;
__crc_console_stop =3D 0xfb0ca1d2 ;
__crc_console_start =3D 0x7a3fb1e2 ;
__crc_register_console =3D 0xb0d88192 ;
__crc_unregister_console =3D 0x8db62ff8 ;
__crc___printk_ratelimit =3D 0x6128b5fc ;
__crc_printk_timed_ratelimit =3D 0x07cc4a5d ;
__crc_kmsg_dump_register =3D 0x030d11a8 ;
__crc_kmsg_dump_unregister =3D 0x3ca16d23 ;

The full verbose log is attached. Any ideas?

--=20
Denys

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="gold-segfault.txt"
Content-Transfer-Encoding: quoted-printable

NOTE: make -j16 -j16 V=3D1 include/linux/version.h CC=3Darm-angstrom-linux-=
gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/beaglebone LD=3Darm-angstrom-linux-gnueabi=
-ld  --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/be=
aglebone
set -e; : '  CHK     include/linux/version.h'; mkdir -p include/linux/; 	(e=
cho \#define LINUX_VERSION_CODE 197136; echo '#define KERNEL_VERSION(a,b,c)=
 (((a) << 16) + ((b) << 8) + (c))';) < /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/Makefile > include/linux/v=
ersion.h.tmp; if [ -r include/linux/version.h ] && cmp -s include/linux/ver=
sion.h include/linux/version.h.tmp; then rm -f include/linux/version.h.tmp;=
 else : '  UPD     include/linux/version.h'; mv -f include/linux/version.h.=
tmp include/linux/version.h; fi
NOTE: make -j16 -j16 V=3D1 uImage CC=3Darm-angstrom-linux-gnueabi-gcc  -mno=
-thumb-interwork -marm --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/beaglebone LD=3Darm-angstrom-linux-gnueabi-ld  --sysroot=3D=
/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone
rm -f include/config/kernel.release
make -f /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angs=
trom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c69=
8cb6816d72f01/git/scripts/Makefile.asm-generic \
            obj=3Darch/arm/include/generated/asm
echo "3.2.16$(/bin/sh /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/b=
eaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f68=
7b61b147b31c698cb6816d72f01/git/scripts/setlocalversion /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git)" > inclu=
de/config/kernel.release
set -e; : '  CHK     include/linux/version.h'; mkdir -p include/linux/; 	(e=
cho \#define LINUX_VERSION_CODE 197136; echo '#define KERNEL_VERSION(a,b,c)=
 (((a) << 16) + ((b) << 8) + (c))';) < /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/Makefile > include/linux/v=
ersion.h.tmp; if [ -r include/linux/version.h ] && cmp -s include/linux/ver=
sion.h include/linux/version.h.tmp; then rm -f include/linux/version.h.tmp;=
 else : '  UPD     include/linux/version.h'; mv -f include/linux/version.h.=
tmp include/linux/version.h; fi
make -f scripts/Makefile.build obj=3Dscripts/basic
rm -f .tmp_quiet_recordmcount
set -e; : '  CHK     include/generated/utsrelease.h'; mkdir -p include/gene=
rated/; 	if [ `echo -n "3.2.16" | wc -c ` -gt 64 ]; then echo '"3.2.16" exc=
eeds 64 characters' >&2; exit 1; fi; (echo \#define UTS_RELEASE \"3.2.16\";=
) < include/config/kernel.release > include/generated/utsrelease.h.tmp; if =
[ -r include/generated/utsrelease.h ] && cmp -s include/generated/utsreleas=
e.h include/generated/utsrelease.h.tmp; then rm -f include/generated/utsrel=
ease.h.tmp; else : '  UPD     include/generated/utsrelease.h'; mv -f includ=
e/generated/utsrelease.h.tmp include/generated/utsrelease.h; fi
make -f scripts/Makefile.build obj=3Dscripts
mkdir -p .tmp_versions=20
make -f scripts/Makefile.build obj=3Dscripts/dtc
make -f scripts/Makefile.build obj=3Dscripts/genksyms
make -f scripts/Makefile.build obj=3Dscripts/mod
make -f scripts/Makefile.build obj=3Darch/arm/tools include/generated/mach-=
types.h
  gcc -Wp,-MD,scripts/.kallsyms.d -Wall -Wmissing-prototypes -Wstrict-proto=
types -O2 -fomit-frame-pointer     -o scripts/kallsyms scripts/kallsyms.c =
=20
  gcc -Wp,-MD,scripts/.pnmtologo.d -Wall -Wmissing-prototypes -Wstrict-prot=
otypes -O2 -fomit-frame-pointer     -o scripts/pnmtologo scripts/pnmtologo.=
c =20
  gcc -Wp,-MD,scripts/.conmakehash.d -Wall -Wmissing-prototypes -Wstrict-pr=
ototypes -O2 -fomit-frame-pointer     -o scripts/conmakehash scripts/conmak=
ehash.c =20
  gcc -Wp,-MD,scripts/.bin2c.d -Wall -Wmissing-prototypes -Wstrict-prototyp=
es -O2 -fomit-frame-pointer     -o scripts/bin2c scripts/bin2c.c =20
  gcc -Wp,-MD,scripts/genksyms/.genksyms.o.d -Wall -Wmissing-prototypes -Ws=
trict-prototypes -O2 -fomit-frame-pointer     -c -o scripts/genksyms/genksy=
ms.o scripts/genksyms/genksyms.c
  gcc -Wp,-MD,scripts/dtc/.checks.o.d -Wall -Wmissing-prototypes -Wstrict-p=
rototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c=
 -o scripts/dtc/checks.o scripts/dtc/checks.c
  gcc -Wp,-MD,scripts/dtc/.data.o.d -Wall -Wmissing-prototypes -Wstrict-pro=
totypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c -=
o scripts/dtc/data.o scripts/dtc/data.c
  cat scripts/dtc/dtc-lexer.lex.c_shipped > scripts/dtc/dtc-lexer.lex.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,sc=
ripts/mod/.empty.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(empty)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(empty)" -c -o scripts/mod/.tmp_empty.o scripts/mod=
/empty.c
  cat scripts/genksyms/lex.lex.c_shipped > scripts/genksyms/lex.lex.c
  cat scripts/genksyms/keywords.hash.c_shipped > scripts/genksyms/keywords.=
hash.c
make[1]: `include/generated/mach-types.h' is up to date.
make -f scripts/Makefile.build obj=3D.
  gcc -Wp,-MD,scripts/mod/.mk_elfconfig.d -Wall -Wmissing-prototypes -Wstri=
ct-prototypes -O2 -fomit-frame-pointer     -o scripts/mod/mk_elfconfig scri=
pts/mod/mk_elfconfig.c =20
  cat scripts/dtc/dtc-parser.tab.h_shipped > scripts/dtc/dtc-parser.tab.h
  cat scripts/genksyms/parse.tab.h_shipped > scripts/genksyms/parse.tab.h
  cat scripts/genksyms/parse.tab.c_shipped > scripts/genksyms/parse.tab.c
  cat scripts/dtc/dtc-parser.tab.c_shipped > scripts/dtc/dtc-parser.tab.c
  gcc -Wp,-MD,scripts/genksyms/.parse.tab.o.d -Wall -Wmissing-prototypes -W=
strict-prototypes -O2 -fomit-frame-pointer    -Iscripts/genksyms -c -o scri=
pts/genksyms/parse.tab.o scripts/genksyms/parse.tab.c
  gcc -Wp,-MD,scripts/dtc/.dtc.o.d -Wall -Wmissing-prototypes -Wstrict-prot=
otypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c -o=
 scripts/dtc/dtc.o scripts/dtc/dtc.c
  gcc -Wp,-MD,scripts/genksyms/.lex.lex.o.d -Wall -Wmissing-prototypes -Wst=
rict-prototypes -O2 -fomit-frame-pointer    -Iscripts/genksyms -c -o script=
s/genksyms/lex.lex.o scripts/genksyms/lex.lex.c
  gcc -Wp,-MD,scripts/dtc/.flattree.o.d -Wall -Wmissing-prototypes -Wstrict=
-prototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt =
-c -o scripts/dtc/flattree.o scripts/dtc/flattree.c
mkdir -p kernel/
  gcc -Wp,-MD,scripts/dtc/.fstree.o.d -Wall -Wmissing-prototypes -Wstrict-p=
rototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c=
 -o scripts/dtc/fstree.o scripts/dtc/fstree.c
mkdir -p arch/arm/kernel/
  gcc -Wp,-MD,scripts/dtc/.livetree.o.d -Wall -Wmissing-prototypes -Wstrict=
-prototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt =
-c -o scripts/dtc/livetree.o scripts/dtc/livetree.c
scripts/genksyms/lex.lex.c_shipped: In function 'yylex1':
scripts/genksyms/lex.lex.c_shipped:904:1: warning: ignoring return value of=
 'fwrite', declared with attribute warn_unused_result
  /bin/sh scripts/checksyscalls.sh arm-angstrom-linux-gnueabi-gcc  -mno-thu=
mb-interwork -marm --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/beaglebone -Wp,-MD,./.missing-syscalls.d  -nostdinc -isystem /O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/=
armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include =
-I/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-l=
inux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb681=
6d72f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -inclu=
de /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-=
linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb68=
16d72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/ar=
m/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-pr=
ototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-f=
unction-declaration -Wno-format-security -fno-delete-null-pointer-checks -O=
s -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwi=
nd-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__L=
INUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=
=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-poin=
ter -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -f=
conserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASEN=
AME=3DKBUILD_STR(missing_syscalls)"  -D"KBUILD_MODNAME=3DKBUILD_STR(missing=
_syscalls)"=20
  gcc -Wp,-MD,scripts/dtc/.srcpos.o.d -Wall -Wmissing-prototypes -Wstrict-p=
rototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c=
 -o scripts/dtc/srcpos.o scripts/dtc/srcpos.c
  scripts/mod/mk_elfconfig < scripts/mod/empty.o > scripts/mod/elfconfig.h
  gcc -Wp,-MD,scripts/mod/.file2alias.o.d -Wall -Wmissing-prototypes -Wstri=
ct-prototypes -O2 -fomit-frame-pointer     -c -o scripts/mod/file2alias.o s=
cripts/mod/file2alias.c
  gcc -Wp,-MD,scripts/dtc/.treesource.o.d -Wall -Wmissing-prototypes -Wstri=
ct-prototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfd=
t -c -o scripts/dtc/treesource.o scripts/dtc/treesource.c
  gcc -Wp,-MD,scripts/dtc/.util.o.d -Wall -Wmissing-prototypes -Wstrict-pro=
totypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/libfdt -c -=
o scripts/dtc/util.o scripts/dtc/util.c
  gcc -Wp,-MD,scripts/dtc/.dtc-lexer.lex.o.d -Wall -Wmissing-prototypes -Ws=
trict-prototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/li=
bfdt -c -o scripts/dtc/dtc-lexer.lex.o scripts/dtc/dtc-lexer.lex.c
  gcc -Wp,-MD,scripts/dtc/.dtc-parser.tab.o.d -Wall -Wmissing-prototypes -W=
strict-prototypes -O2 -fomit-frame-pointer    -Iscripts/dtc -Iscripts/dtc/l=
ibfdt -c -o scripts/dtc/dtc-parser.tab.o scripts/dtc/dtc-parser.tab.c
  gcc -Wp,-MD,scripts/mod/.modpost.o.d -Wall -Wmissing-prototypes -Wstrict-=
prototypes -O2 -fomit-frame-pointer     -c -o scripts/mod/modpost.o scripts=
/mod/modpost.c
  gcc -Wp,-MD,scripts/mod/.sumversion.o.d -Wall -Wmissing-prototypes -Wstri=
ct-prototypes -O2 -fomit-frame-pointer     -c -o scripts/mod/sumversion.o s=
cripts/mod/sumversion.c
  gcc  -o scripts/dtc/dtc scripts/dtc/dtc.o scripts/dtc/flattree.o scripts/=
dtc/fstree.o scripts/dtc/data.o scripts/dtc/livetree.o scripts/dtc/treesour=
ce.o scripts/dtc/srcpos.o scripts/dtc/checks.o scripts/dtc/util.o scripts/d=
tc/dtc-lexer.lex.o scripts/dtc/dtc-parser.tab.o =20
  gcc  -o scripts/genksyms/genksyms scripts/genksyms/genksyms.o scripts/gen=
ksyms/parse.tab.o scripts/genksyms/lex.lex.o =20
  gcc  -o scripts/mod/modpost scripts/mod/modpost.o scripts/mod/file2alias.=
o scripts/mod/sumversion.o =20
make -f scripts/Makefile.build obj=3Dinit
make -f scripts/Makefile.build obj=3Dusr
make -f scripts/Makefile.build obj=3Darch/arm/vfp
/bin/sh /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angs=
trom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c69=
8cb6816d72f01/git/scripts/mkcompile_h include/generated/compile.h \
"arm" "" "" "arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --s=
ysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone=
 -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno=
-common -Werror-implicit-function-declaration -Wno-format-security -fno-del=
ete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -=
mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,=
-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a   -msoft-flo=
at -Uarm -Wframe-larger-than=3D1024  -fno-stack-protector -Wno-unused-but-s=
et-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer=
-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO"
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.main.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-eg=
libc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-an=
gstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/=
include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D_=
_KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-oma=
p/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alia=
sing -fno-common -Werror-implicit-function-declaration -Wno-format-security=
 -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapc=
s-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dal=
ways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -ms=
oft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused=
-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-p=
ointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"=
KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(main)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(main)" -c -o init/.tmp_main.o init/main.c
make -f scripts/Makefile.build obj=3Darch/arm/kernel
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.do_mounts.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/a=
rm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch=
/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.=
h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pla=
t-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-sec=
urity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(do_mounts)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(mounts)" -c -o init/.tmp_do_mounts.o init/do_mo=
unts.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.do_mounts_rd.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(do_mounts_rd)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(mounts)" -c -o init/.tmp_do_mounts_rd.o ini=
t/do_mounts_rd.c
make -f scripts/Makefile.build obj=3Darch/arm/mm
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.initramfs.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/a=
rm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch=
/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.=
h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pla=
t-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-sec=
urity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(initramfs)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(initramfs)" -c -o init/.tmp_initramfs.o init/in=
itramfs.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.do_mounts_initrd.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(do_mounts=
_initrd)"  -D"KBUILD_MODNAME=3DKBUILD_STR(mounts)" -c -o init/.tmp_do_mount=
s_initrd.o init/do_mounts_initrd.c
  gcc -Wp,-MD,usr/.gen_init_cpio.d -Wall -Wmissing-prototypes -Wstrict-prot=
otypes -O2 -fomit-frame-pointer     -o usr/gen_init_cpio usr/gen_init_cpio.=
c =20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.calibrate.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/a=
rm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch=
/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.=
h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pla=
t-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-sec=
urity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(calibrate)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(calibrate)" -c -o init/.tmp_calibrate.o init/ca=
librate.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/vfp/.vfpmodule.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vfpmodule=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(vfp)" -c -o arch/arm/vfp/.tmp_vfpmodule.=
o arch/arm/vfp/vfpmodule.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/vfp/.entry.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwork =
-funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated=
 -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -include asm/unified=
.h -Wa,-mfpu=3Dsoftvfp+vfp -mfloat-abi=3Dsoft        -c -o arch/arm/vfp/ent=
ry.o arch/arm/vfp/entry.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/vfp/.vfphw.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwork =
-funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated=
 -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -include asm/unified=
.h -Wa,-mfpu=3Dsoftvfp+vfp -mfloat-abi=3Dsoft        -c -o arch/arm/vfp/vfp=
hw.o arch/arm/vfp/vfphw.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/vfp/.vfpsingle.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vfpsingle=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(vfp)" -c -o arch/arm/vfp/.tmp_vfpsingle.=
o arch/arm/vfp/vfpsingle.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/vfp/.vfpdouble.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vfpdouble=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(vfp)" -c -o arch/arm/vfp/.tmp_vfpdouble.=
o arch/arm/vfp/vfpdouble.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.entry-armv.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-in=
terwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-de=
precated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include as=
m/unified.h -msoft-float        -c -o arch/arm/kernel/entry-armv.o arch/arm=
/kernel/entry-armv.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.elf.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(elf)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(elf)" -c -o arch/arm/kernel/.tmp_elf.o arch/arm/ke=
rnel/elf.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.dma-mapping.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dma_mappi=
ng)"  -D"KBUILD_MODNAME=3DKBUILD_STR(dma_mapping)" -c -o arch/arm/mm/.tmp_d=
ma-mapping.o arch/arm/mm/dma-mapping.c
  UPD     include/generated/compile.h
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.extable.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(extable)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(extable)" -c -o arch/arm/mm/.tmp_extable.o arc=
h/arm/mm/extable.c
make -f scripts/Makefile.build obj=3Darch/arm/common
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.entry-common.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-=
interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-=
deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include =
asm/unified.h -msoft-float        -c -o arch/arm/kernel/entry-common.o arch=
/arm/kernel/entry-common.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.fault.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fault)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(fault)" -c -o arch/arm/mm/.tmp_fault.o arch/arm/mm=
/fault.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.irq.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(irq)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(irq)" -c -o arch/arm/kernel/.tmp_irq.o arch/arm/ke=
rnel/irq.c
/bin/sh /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angs=
trom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c69=
8cb6816d72f01/git/scripts/gen_initramfs_list.sh -l -d > usr/.initramfs_data=
.cpio.d
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/common/.edma.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-form=
at-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -=
mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpli=
cit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3D=
armv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector =
-Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-state=
ment -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_=
GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(edma)"  -D"K=
BUILD_MODNAME=3DKBUILD_STR(edma)" -c -o arch/arm/common/.tmp_edma.o arch/ar=
m/common/edma.c
  /bin/sh /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-an=
gstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c=
698cb6816d72f01/git/scripts/gen_initramfs_list.sh -o usr/initramfs_data.cpi=
o   -d
make -f scripts/Makefile.build obj=3Darch/arm/mach-omap2
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.process.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(process)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(process)" -c -o arch/arm/kernel/.tmp_proce=
ss.o arch/arm/kernel/process.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.init.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc=
/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-=
r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iar=
ch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfi=
g.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/p=
lat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-s=
ecurity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(init)"  -D"KBUIL=
D_MODNAME=3DKBUILD_STR(init)" -c -o arch/arm/mm/.tmp_init.o arch/arm/mm/ini=
t.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.ptrace.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(ptrace)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(ptrace)" -c -o arch/arm/kernel/.tmp_ptrace.=
o arch/arm/kernel/ptrace.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.return_address.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(re=
turn_address)"  -D"KBUILD_MODNAME=3DKBUILD_STR(return_address)" -c -o arch/=
arm/kernel/.tmp_return_address.o arch/arm/kernel/return_address.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,in=
it/.version.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(version)"  -D"KBUI=
LD_MODNAME=3DKBUILD_STR(version)" -c -o init/.tmp_version.o init/version.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.id.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(id)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(id)" -c -o arch/arm/mach-omap2/.tmp_id.o arch/a=
rm/mach-omap2/id.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.io.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(io)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(io)" -c -o arch/arm/mach-omap2/.tmp_io.o arch/a=
rm/mach-omap2/io.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,us=
r/.initramfs_data.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwork =
-funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated=
 -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/unifie=
d.h -msoft-float     -DINITRAMFS_IMAGE=3D"usr/initramfs_data.cpio"   -c -o =
usr/initramfs_data.o usr/initramfs_data.S
arch/arm/kernel/return_address.c:62:2: warning: #warning "TODO: return_addr=
ess should use unwind tables" [-Wcpp]
  arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/beaglebone  --no-warn-mismatch   -r -o arch/arm/v=
fp/vfp.o arch/arm/vfp/vfpmodule.o arch/arm/vfp/entry.o arch/arm/vfp/vfphw.o=
 arch/arm/vfp/vfpsingle.o arch/arm/vfp/vfpdouble.o=20
make -f scripts/Makefile.build obj=3Darch/arm/plat-omap
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.iomap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(iomap)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(iomap)" -c -o arch/arm/mm/.tmp_iomap.o arch/arm/mm=
/iomap.c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone  --no-warn-mismatch   -r -o arch/arm/=
vfp/built-in.o arch/arm/vfp/vfp.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.control.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(contr=
ol)"  -D"KBUILD_MODNAME=3DKBUILD_STR(control)" -c -o arch/arm/mach-omap2/.t=
mp_control.o arch/arm/mach-omap2/control.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.common.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(common)=
"  -D"KBUILD_MODNAME=3DKBUILD_STR(common)" -c -o arch/arm/plat-omap/.tmp_co=
mmon.o arch/arm/plat-omap/common.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.sram.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sram)"  -=
D"KBUILD_MODNAME=3DKBUILD_STR(sram)" -c -o arch/arm/plat-omap/.tmp_sram.o a=
rch/arm/plat-omap/sram.c
arch/arm/kernel/return_address.c:62:2: warning: #warning "TODO: return_addr=
ess should use unwind tables" [-Wcpp]
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.clock.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clock)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(clock)" -c -o arch/arm/plat-omap/.tmp_clock=
.o arch/arm/plat-omap/clock.c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o usr/built-in.o usr/initramfs=
_data.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.devices.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(device=
s)"  -D"KBUILD_MODNAME=3DKBUILD_STR(devices)" -c -o arch/arm/plat-omap/.tmp=
_devices.o arch/arm/plat-omap/devices.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.mux.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mux)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(mux)" -c -o arch/arm/mach-omap2/.tmp_mux.o arc=
h/arm/mach-omap2/mux.c
make -f scripts/Makefile.build obj=3Dkernel
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.fault-armv.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fault_arm=
v)"  -D"KBUILD_MODNAME=3DKBUILD_STR(fault_armv)" -c -o arch/arm/mm/.tmp_fau=
lt-armv.o arch/arm/mm/fault-armv.c
  arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/beaglebone    -r -o init/mounts.o init/do_mounts.=
o init/do_mounts_rd.o init/do_mounts_initrd.o=20
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o init/built-in.o init/main.o =
init/version.o init/mounts.o init/initramfs.o init/calibrate.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ke=
rnel/.sched.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -=
fno-omit-frame-pointer    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUIL=
D_STR(sched)"  -D"KBUILD_MODNAME=3DKBUILD_STR(sched)" -c -o kernel/.tmp_sch=
ed.o kernel/sched.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.mux.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mux)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(mux)" -c -o arch/arm/plat-omap/.tmp_mux.o arch=
/arm/plat-omap/mux.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.devices.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(devic=
es)"  -D"KBUILD_MODNAME=3DKBUILD_STR(devices)" -c -o arch/arm/mach-omap2/.t=
mp_devices.o arch/arm/mach-omap2/devices.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.setup.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(setup)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(setup)" -c -o arch/arm/kernel/.tmp_setup.o a=
rch/arm/kernel/setup.c
make -f scripts/Makefile.build obj=3Dmm
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.flush.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(flush)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(flush)" -c -o arch/arm/mm/.tmp_flush.o arch/arm/mm=
/flush.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.filemap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(filemap)"  -D"KBUILD_M=
ODNAME=3DKBUILD_STR(filemap)" -c -o mm/.tmp_filemap.o mm/filemap.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.mempool.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mempool)"  -D"KBUILD_M=
ODNAME=3DKBUILD_STR(mempool)" -c -o mm/.tmp_mempool.o mm/mempool.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.oom_kill.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/ar=
m/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -=
D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-o=
map/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -Werror-implicit-function-declaration -Wno-format-securi=
ty -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daa=
pcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3D=
always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -=
msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unus=
ed-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno=
-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(oom_kill)"  -D"KBUILD=
_MODNAME=3DKBUILD_STR(oom_kill)" -c -o mm/.tmp_oom_kill.o mm/oom_kill.c
make -f scripts/Makefile.build obj=3Dfs
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o arch/arm/common/built-in.o a=
rch/arm/common/edma.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.idmap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(idmap)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(idmap)" -c -o arch/arm/mm/.tmp_idmap.o arch/arm/mm=
/idmap.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.serial.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(serial=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(serial)" -c -o arch/arm/mach-omap2/.tmp_=
serial.o arch/arm/mach-omap2/serial.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.open.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(open)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(open)" -c -o fs/.tmp_open.o fs/open.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ke=
rnel/.fork.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/ar=
m/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -=
D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-o=
map/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -Werror-implicit-function-declaration -Wno-format-securi=
ty -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daa=
pcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3D=
always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -=
msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unus=
ed-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno=
-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fork)"  -D"KBUILD_MOD=
NAME=3DKBUILD_STR(fork)" -c -o kernel/.tmp_fork.o kernel/fork.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.ioremap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(ioremap)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(ioremap)" -c -o arch/arm/mm/.tmp_ioremap.o arc=
h/arm/mm/ioremap.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.gpmc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(gpmc)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(gpmc)" -c -o arch/arm/mach-omap2/.tmp_gpmc.o=
 arch/arm/mach-omap2/gpmc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.usb.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(usb)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(usb)" -c -o arch/arm/plat-omap/.tmp_usb.o arch=
/arm/plat-omap/usb.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.fb.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fb)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(fb)" -c -o arch/arm/plat-omap/.tmp_fb.o arch/ar=
m/plat-omap/fb.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.counter_32k.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(co=
unter_32k)"  -D"KBUILD_MODNAME=3DKBUILD_STR(counter_32k)" -c -o arch/arm/pl=
at-omap/.tmp_counter_32k.o arch/arm/plat-omap/counter_32k.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.timer.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(timer)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(timer)" -c -o arch/arm/mach-omap2/.tmp_tim=
er.o arch/arm/mach-omap2/timer.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.mmap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc=
/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-=
r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iar=
ch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfi=
g.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/p=
lat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-s=
ecurity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mmap)"  -D"KBUIL=
D_MODNAME=3DKBUILD_STR(mmap)" -c -o arch/arm/mm/.tmp_mmap.o arch/arm/mm/mma=
p.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.pm.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pm)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(pm)" -c -o arch/arm/mach-omap2/.tmp_pm.o arch/a=
rm/mach-omap2/pm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.fadvise.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fadvise)"  -D"KBUILD_M=
ODNAME=3DKBUILD_STR(fadvise)" -c -o mm/.tmp_fadvise.o mm/fadvise.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.common.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(common=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(common)" -c -o arch/arm/mach-omap2/.tmp_=
common.o arch/arm/mach-omap2/common.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.gpio.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(gpio)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(gpio)" -c -o arch/arm/mach-omap2/.tmp_gpio.o=
 arch/arm/mach-omap2/gpio.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.maccess.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(maccess)"  -D"KBUILD_M=
ODNAME=3DKBUILD_STR(maccess)" -c -o mm/.tmp_maccess.o mm/maccess.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.read_write.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(read_write)"  -D"K=
BUILD_MODNAME=3DKBUILD_STR(read_write)" -c -o fs/.tmp_read_write.o fs/read_=
write.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.sdma2edma.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sdma=
2edma)"  -D"KBUILD_MODNAME=3DKBUILD_STR(sdma2edma)" -c -o arch/arm/plat-oma=
p/.tmp_sdma2edma.o arch/arm/plat-omap/sdma2edma.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.pgd.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/=
arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarc=
h/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-=
r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig=
.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pl=
at-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-stric=
t-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-se=
curity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pgd)"  -D"KBUILD=
_MODNAME=3DKBUILD_STR(pgd)" -c -o arch/arm/mm/.tmp_pgd.o arch/arm/mm/pgd.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.signal.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(signal)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(signal)" -c -o arch/arm/kernel/.tmp_signal.=
o arch/arm/kernel/signal.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.sys_arm.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sys_arm)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(sys_arm)" -c -o arch/arm/kernel/.tmp_sys_a=
rm.o arch/arm/kernel/sys_arm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ke=
rnel/.exec_domain.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -ma=
bi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplici=
t-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Dar=
mv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -W=
no-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-stateme=
nt -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GO=
TO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(exec_domain)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(exec_domain)" -c -o kernel/.tmp_exec_domain=
.o kernel/exec_domain.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.mmu.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/=
arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarc=
h/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-=
r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig=
.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pl=
at-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-stric=
t-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-se=
curity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mmu)"  -D"KBUILD=
_MODNAME=3DKBUILD_STR(mmu)" -c -o arch/arm/mm/.tmp_mmu.o arch/arm/mm/mmu.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.page_alloc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(page_alloc)"  -D"K=
BUILD_MODNAME=3DKBUILD_STR(page_alloc)" -c -o mm/.tmp_page_alloc.o mm/page_=
alloc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.vmregion.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-form=
at-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -=
mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpli=
cit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3D=
armv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector =
-Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-state=
ment -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_=
GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vmregion)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(vmregion)" -c -o arch/arm/mm/.tmp_vmregion.o=
 arch/arm/mm/vmregion.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.proc-syms.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(proc_syms=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(proc_syms)" -c -o arch/arm/mm/.tmp_proc-=
syms.o arch/arm/mm/proc-syms.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.dma.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dma)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(dma)" -c -o arch/arm/mach-omap2/.tmp_dma.o arc=
h/arm/mach-omap2/dma.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.wd_timer.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(wd_t=
imer)"  -D"KBUILD_MODNAME=3DKBUILD_STR(wd_timer)" -c -o arch/arm/mach-omap2=
/.tmp_wd_timer.o arch/arm/mach-omap2/wd_timer.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.display.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(displ=
ay)"  -D"KBUILD_MODNAME=3DKBUILD_STR(display)" -c -o arch/arm/mach-omap2/.t=
mp_display.o arch/arm/mach-omap2/display.c
make -f scripts/Makefile.build obj=3Dipc
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.stacktrace.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(stackt=
race)"  -D"KBUILD_MODNAME=3DKBUILD_STR(stacktrace)" -c -o arch/arm/kernel/.=
tmp_stacktrace.o arch/arm/kernel/stacktrace.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.time.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-form=
at-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -=
mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpli=
cit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3D=
armv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector =
-Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-state=
ment -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_=
GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(time)"  -D"K=
BUILD_MODNAME=3DKBUILD_STR(time)" -c -o arch/arm/kernel/.tmp_time.o arch/ar=
m/kernel/time.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.util.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(util)"  -D"KBUILD_MODNAM=
E=3DKBUILD_STR(util)" -c -o ipc/.tmp_util.o ipc/util.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/kernel/.traps.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(traps)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(traps)" -c -o arch/arm/kernel/.tmp_traps.o a=
rch/arm/kernel/traps.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.irq.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(irq)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(irq)" -c -o arch/arm/mach-omap2/.tmp_irq.o arc=
h/arm/mach-omap2/irq.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.omap_device.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(om=
ap_device)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_device)" -c -o arch/arm/pl=
at-omap/.tmp_omap_device.o arch/arm/plat-omap/omap_device.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.mcbsp.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mcbsp)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(mcbsp)" -c -o arch/arm/plat-omap/.tmp_mcbsp=
.o arch/arm/plat-omap/mcbsp.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.page-writeback.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(page_writeback)=
"  -D"KBUILD_MODNAME=3DKBUILD_STR(page_writeback)" -c -o mm/.tmp_page-write=
back.o mm/page-writeback.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.dmtimer.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dmtime=
r)"  -D"KBUILD_MODNAME=3DKBUILD_STR(dmtimer)" -c -o arch/arm/plat-omap/.tmp=
_dmtimer.o arch/arm/plat-omap/dmtimer.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,mm=
/.readahead.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(readahead)"  -D"KB=
UILD_MODNAME=3DKBUILD_STR(readahead)" -c -o mm/.tmp_readahead.o mm/readahea=
d.c
/bin/sh: line 1: 13074 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o mm/filemap.o mm/.tmp_filemap.o -T mm/.tmp_filemap.ver
make[1]: *** [mm/filemap.o] Error 139
make[1]: *** Waiting for unfinished jobs....
make -f scripts/Makefile.build obj=3Dsecurity
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.i2c.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(i2c)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(i2c)" -c -o arch/arm/plat-omap/.tmp_i2c.o arch=
/arm/plat-omap/i2c.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.msgutil.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/ar=
m/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -=
D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-o=
map/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -Werror-implicit-function-declaration -Wno-format-securi=
ty -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daa=
pcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3D=
always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -=
msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unus=
ed-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno=
-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(msgutil)"  -D"KBUILD_=
MODNAME=3DKBUILD_STR(msgutil)" -c -o ipc/.tmp_msgutil.o ipc/msgutil.c
make -f scripts/Makefile.build obj=3Dsecurity/keys
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.gc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc=
/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-=
r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iar=
ch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfi=
g.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/p=
lat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-s=
ecurity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(gc)"  -D"KBUILD_=
MODNAME=3DKBUILD_STR(gc)" -c -o security/keys/.tmp_gc.o security/keys/gc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.commoncap.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -ma=
bi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplici=
t-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Dar=
mv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -W=
no-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-stateme=
nt -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GO=
TO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(commoncap)"  -=
D"KBUILD_MODNAME=3DKBUILD_STR(commoncap)" -c -o security/.tmp_commoncap.o s=
ecurity/commoncap.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.file_table.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(file_table)"  -D"K=
BUILD_MODNAME=3DKBUILD_STR(file_table)" -c -o fs/.tmp_file_table.o fs/file_=
table.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.alignment.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(alignment=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(alignment)" -c -o arch/arm/mm/.tmp_align=
ment.o arch/arm/mm/alignment.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.sdrc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sdrc)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(sdrc)" -c -o arch/arm/mach-omap2/.tmp_sdrc.o=
 arch/arm/mach-omap2/sdrc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.abort-ev7.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwo=
rk -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-depreca=
ted -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/uni=
fied.h -msoft-float     -Wa,-march=3Darmv7-a   -c -o arch/arm/mm/abort-ev7.=
o arch/arm/mm/abort-ev7.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.super.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(super)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(super)" -c -o fs/.tmp_super.o fs/super.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.char_dev.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/ar=
m/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -=
D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-o=
map/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -Werror-implicit-function-declaration -Wno-format-securi=
ty -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daa=
pcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3D=
always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -=
msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unus=
ed-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno=
-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(char_dev)"  -D"KBUILD=
_MODNAME=3DKBUILD_STR(char_dev)" -c -o fs/.tmp_char_dev.o fs/char_dev.c
/bin/sh: line 1: 13193 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o arch/arm/kernel/traps.o arch/arm/kernel/.tmp_traps.o -T arch/ar=
m/kernel/.tmp_traps.ver
make[1]: *** [arch/arm/kernel/traps.o] Error 139
make: *** [arch/arm/kernel] Error 2
make: *** Waiting for unfinished jobs....
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ke=
rnel/.panic.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(panic)"  -D"KBUILD=
_MODNAME=3DKBUILD_STR(panic)" -c -o kernel/.tmp_panic.o kernel/panic.c
arch/arm/mm/alignment.c: In function 'do_alignment':
arch/arm/mm/alignment.c:326:15: warning: 'offset.un' may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
arch/arm/mm/alignment.c:748:21: note: 'offset.un' was declared here
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.msg.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(msg)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(msg)" -c -o ipc/.tmp_msg.o ipc/msg.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ke=
rnel/.printk.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(printk)"  -D"KBUIL=
D_MODNAME=3DKBUILD_STR(printk)" -c -o kernel/.tmp_printk.o kernel/printk.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.sem.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sem)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(sem)" -c -o ipc/.tmp_sem.o ipc/sem.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(om=
ap_hwmod)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_hwmod)" -c -o arch/arm/mach=
-omap2/.tmp_omap_hwmod.o arch/arm/mach-omap2/omap_hwmod.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.key.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(key)"  -D"KBUIL=
D_MODNAME=3DKBUILD_STR(key)" -c -o security/keys/.tmp_key.o security/keys/k=
ey.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.shm.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(shm)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(shm)" -c -o ipc/.tmp_shm.o ipc/shm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.pabort-v7.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwo=
rk -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-depreca=
ted -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/uni=
fied.h -msoft-float        -c -o arch/arm/mm/pabort-v7.o arch/arm/mm/pabort=
-v7.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.mailbox.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mailbo=
x)"  -D"KBUILD_MODNAME=3DKBUILD_STR(mailbox)" -c -o arch/arm/plat-omap/.tmp=
_mailbox.o arch/arm/plat-omap/mailbox.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/plat-omap/.omap-pm-noop.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(o=
map_pm_noop)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_pm_noop)" -c -o arch/arm=
/plat-omap/.tmp_omap-pm-noop.o arch/arm/plat-omap/omap-pm-noop.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.cache-v7.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwor=
k -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecat=
ed -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/unif=
ied.h -msoft-float     -Wa,-march=3Darmv7-a   -c -o arch/arm/mm/cache-v7.o =
arch/arm/mm/cache-v7.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.copypage-v6.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(copypage_=
v6)"  -D"KBUILD_MODNAME=3DKBUILD_STR(copypage_v6)" -c -o arch/arm/mm/.tmp_c=
opypage-v6.o arch/arm/mm/copypage-v6.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.context.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(context)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(context)" -c -o arch/arm/mm/.tmp_context.o arc=
h/arm/mm/context.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.stat.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(stat)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(stat)" -c -o fs/.tmp_stat.o fs/stat.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.tlb-v7.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwork =
-funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated=
 -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/unifie=
d.h -msoft-float     -Wa,-march=3Darmv7-a   -c -o arch/arm/mm/tlb-v7.o arch=
/arm/mm/tlb-v7.S
make: *** [mm] Error 2
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.min_addr.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(min_addr)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(min_addr)" -c -o security/.tmp_min_addr.o secur=
ity/min_addr.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mm/.proc-v7.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-interwork=
 -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecate=
d -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include asm/unifi=
ed.h -msoft-float     -Wa,-march=3Darmv7-a   -c -o arch/arm/mm/proc-v7.o ar=
ch/arm/mm/proc-v7.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.security.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2=
-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Ia=
rch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconf=
ig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/=
plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-str=
ict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-=
security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mab=
i=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit=
-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darm=
v7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wn=
o-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statemen=
t -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOT=
O    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(security)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(security)" -c -o security/.tmp_security.o secur=
ity/security.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.capability.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/=
gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -=
Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kco=
nfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/ar=
m/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-forma=
t-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -m=
abi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplic=
it-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Da=
rmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statem=
ent -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_G=
OTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(capability)" =
 -D"KBUILD_MODNAME=3DKBUILD_STR(capability)" -c -o security/.tmp_capability=
.o security/capability.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.ipcns_notifier.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -ma=
bi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplici=
t-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Dar=
mv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -W=
no-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-stateme=
nt -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GO=
TO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(ipcns_notifier=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(ipcns_notifier)" -c -o ipc/.tmp_ipcns_no=
tifier.o ipc/ipcns_notifier.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.keyring.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueab=
i/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include=
 -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/k=
config.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/=
arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno=
-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-for=
mat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm =
-mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpl=
icit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(keyring)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(keyring)" -c -o security/keys/.tmp_keyring=
.o security/keys/keyring.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.keyctl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-form=
at-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -=
mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpli=
cit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3D=
armv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector =
-Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-state=
ment -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_=
GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(keyctl)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(keyctl)" -c -o security/keys/.tmp_keyctl.o sec=
urity/keys/keyctl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.exec.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(exec)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(exec)" -c -o fs/.tmp_exec.o fs/exec.c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o arch/arm/plat-omap/built-in.=
o arch/arm/plat-omap/common.o arch/arm/plat-omap/sram.o arch/arm/plat-omap/=
clock.o arch/arm/plat-omap/devices.o arch/arm/plat-omap/mux.o arch/arm/plat=
-omap/usb.o arch/arm/plat-omap/fb.o arch/arm/plat-omap/counter_32k.o arch/a=
rm/plat-omap/sdma2edma.o arch/arm/plat-omap/omap_device.o arch/arm/plat-oma=
p/mcbsp.o arch/arm/plat-omap/dmtimer.o arch/arm/plat-omap/i2c.o arch/arm/pl=
at-omap/mailbox.o arch/arm/plat-omap/omap-pm-noop.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.inode.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/a=
rm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch=
/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.=
h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pla=
t-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-sec=
urity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(inode)"  -D"KBUI=
LD_MODNAME=3DKBUILD_STR(inode)" -c -o security/.tmp_inode.o security/inode.=
c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o arch/arm/mm/built-in.o arch/=
arm/mm/dma-mapping.o arch/arm/mm/extable.o arch/arm/mm/fault.o arch/arm/mm/=
init.o arch/arm/mm/iomap.o arch/arm/mm/fault-armv.o arch/arm/mm/flush.o arc=
h/arm/mm/idmap.o arch/arm/mm/ioremap.o arch/arm/mm/mmap.o arch/arm/mm/pgd.o=
 arch/arm/mm/mmu.o arch/arm/mm/vmregion.o arch/arm/mm/proc-syms.o arch/arm/=
mm/alignment.o arch/arm/mm/abort-ev7.o arch/arm/mm/pabort-v7.o arch/arm/mm/=
cache-v7.o arch/arm/mm/copypage-v6.o arch/arm/mm/context.o arch/arm/mm/tlb-=
v7.o arch/arm/mm/proc-v7.o=20
/bin/sh: line 1: 13477 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o arch/arm/mm/built-in.o arch/arm/mm/dma-mapping.o arch/arm/mm/ex=
table.o arch/arm/mm/fault.o arch/arm/mm/init.o arch/arm/mm/iomap.o arch/arm=
/mm/fault-armv.o arch/arm/mm/flush.o arch/arm/mm/idmap.o arch/arm/mm/iorema=
p.o arch/arm/mm/mmap.o arch/arm/mm/pgd.o arch/arm/mm/mmu.o arch/arm/mm/vmre=
gion.o arch/arm/mm/proc-syms.o arch/arm/mm/alignment.o arch/arm/mm/abort-ev=
7.o arch/arm/mm/pabort-v7.o arch/arm/mm/cache-v7.o arch/arm/mm/copypage-v6.=
o arch/arm/mm/context.o arch/arm/mm/tlb-v7.o arch/arm/mm/proc-v7.o
make[1]: *** [arch/arm/mm/built-in.o] Error 139
make: *** [arch/arm/mm] Error 2
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod_common_data.o.d  -nostdinc -isystem /OE/angst=
rom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-=
angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gn=
ueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01=
/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/=
angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-g=
nueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f0=
1/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-=
omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototype=
s -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function=
-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm=
 -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tabl=
es -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_AR=
M_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024=
 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wd=
eclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserv=
e-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DK=
BUILD_STR(omap_hwmod_common_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_hwm=
od_common_data)" -c -o arch/arm/mach-omap2/.tmp_omap_hwmod_common_data.o ar=
ch/arm/mach-omap2/omap_hwmod_common_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.permission.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(permissi=
on)"  -D"KBUILD_MODNAME=3DKBUILD_STR(permission)" -c -o security/keys/.tmp_=
permission.o security/keys/permission.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.lsm_audit.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -ma=
bi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplici=
t-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Dar=
mv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -W=
no-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-stateme=
nt -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GO=
TO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(lsm_audit)"  -=
D"KBUILD_MODNAME=3DKBUILD_STR(lsm_audit)" -c -o security/.tmp_lsm_audit.o s=
ecurity/lsm_audit.c
/bin/sh: line 1: 13513 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o kernel/printk.o kernel/.tmp_printk.o -T kernel/.tmp_printk.ver
make[1]: *** [kernel/printk.o] Error 139
make[1]: *** Waiting for unfinished jobs....
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.process_keys.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(proces=
s_keys)"  -D"KBUILD_MODNAME=3DKBUILD_STR(process_keys)" -c -o security/keys=
/.tmp_process_keys.o security/keys/process_keys.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.request_key.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(request=
_key)"  -D"KBUILD_MODNAME=3DKBUILD_STR(request_key)" -c -o security/keys/.t=
mp_request_key.o security/keys/request_key.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap-smc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-=
interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-=
deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include =
asm/unified.h -msoft-float     -Wa,-march=3Darmv7-a+sec   -c -o arch/arm/ma=
ch-omap2/omap-smc.o arch/arm/mach-omap2/omap-smc.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.syscall.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/ar=
m/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -=
D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-o=
map/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -Werror-implicit-function-declaration -Wno-format-securi=
ty -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daa=
pcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3D=
always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -=
msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unus=
ed-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno=
-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -=
D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(syscall)"  -D"KBUILD_=
MODNAME=3DKBUILD_STR(syscall)" -c -o ipc/.tmp_syscall.o ipc/syscall.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.ipc_sysctl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/a=
rm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch=
/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_=
v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r=
11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.=
h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/pla=
t-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict=
-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-sec=
urity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=
=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-=
it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv=
7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno=
-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement=
 -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO=
    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(ipc_sysctl)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(ipc_sysctl)" -c -o ipc/.tmp_ipc_sysctl.o ipc/i=
pc_sysctl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.mqueue.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mqueue)"  -D"KBUILD_MO=
DNAME=3DKBUILD_STR(mqueue)" -c -o ipc/.tmp_mqueue.o ipc/mqueue.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap-secure.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(o=
map_secure)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_secure)" -c -o arch/arm/m=
ach-omap2/.tmp_omap-secure.o arch/arm/mach-omap2/omap-secure.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/.device_cgroup.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(device_cg=
roup)"  -D"KBUILD_MODNAME=3DKBUILD_STR(device_cgroup)" -c -o security/.tmp_=
device_cgroup.o security/device_cgroup.c
make: *** [kernel] Error 2
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.request_key_auth.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(re=
quest_key_auth)"  -D"KBUILD_MODNAME=3DKBUILD_STR(request_key_auth)" -c -o s=
ecurity/keys/.tmp_request_key_auth.o security/keys/request_key_auth.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.namespace.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(namespace)"  -D"KB=
UILD_MODNAME=3DKBUILD_STR(namespace)" -c -o ipc/.tmp_namespace.o ipc/namesp=
ace.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.mcbsp.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mcbsp)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(mcbsp)" -c -o arch/arm/mach-omap2/.tmp_mcb=
sp.o arch/arm/mach-omap2/mcbsp.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_twl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(omap=
_twl)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_twl)" -c -o arch/arm/mach-omap2=
/.tmp_omap_twl.o arch/arm/mach-omap2/omap_twl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.sram34xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb-=
interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-=
deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include =
asm/unified.h -msoft-float     -Wa,-march=3Darmv7-a   -c -o arch/arm/mach-o=
map2/sram34xx.o arch/arm/mach-omap2/sram34xx.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.pipe.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pipe)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(pipe)" -c -o fs/.tmp_pipe.o fs/pipe.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.user_defined.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(user_d=
efined)"  -D"KBUILD_MODNAME=3DKBUILD_STR(user_defined)" -c -o security/keys=
/.tmp_user_defined.o security/keys/user_defined.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.mux34xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mux34=
xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(mux34xx)" -c -o arch/arm/mach-omap2/.t=
mp_mux34xx.o arch/arm/mach-omap2/mux34xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.proc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/g=
cc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.=
2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -I=
arch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3=
.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kcon=
fig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm=
/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -ma=
bi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplici=
t-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Dar=
mv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -W=
no-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-stateme=
nt -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GO=
TO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(proc)"  -D"KBU=
ILD_MODNAME=3DKBUILD_STR(proc)" -c -o security/keys/.tmp_proc.o security/ke=
ys/proc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.namei.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(namei)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(namei)" -c -o fs/.tmp_namei.o fs/namei.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.fcntl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fcntl)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(fcntl)" -c -o fs/.tmp_fcntl.o fs/fcntl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,se=
curity/keys/.sysctl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom=
_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-=
3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include =
-Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp=
-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kc=
onfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/a=
rm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-=
strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-form=
at-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -=
mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimpli=
cit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3D=
armv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector =
-Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-state=
ment -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_=
GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(sysctl)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(sysctl)" -c -o security/keys/.tmp_sysctl.o sec=
urity/keys/sysctl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ip=
c/.mq_sysctl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/ar=
m-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/=
arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v=
2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r1=
1i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h=
 -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat=
-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-=
aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-secu=
rity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3D=
aapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mq_sysctl)"  -D"KB=
UILD_MODNAME=3DKBUILD_STR(mq_sysctl)" -c -o ipc/.tmp_mq_sysctl.o ipc/mq_sys=
ctl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.mux33xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mux33=
xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(mux33xx)" -c -o arch/arm/mach-omap2/.t=
mp_mux33xx.o arch/arm/mach-omap2/mux33xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.opp.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(opp)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(opp)" -c -o arch/arm/mach-omap2/.tmp_opp.o arc=
h/arm/mach-omap2/opp.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.opp3xxx_data.o.d  -nostdinc -isystem /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-l=
inux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/=
arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/lin=
ux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/incl=
ude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/incl=
ude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declarati=
on -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwar=
f2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb=
 -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(opp3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(opp3xxx_data)" -c -o arch/=
arm/mach-omap2/.tmp_opp3xxx_data.o arch/arm/mach-omap2/opp3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.ioctl.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(ioctl)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(ioctl)" -c -o fs/.tmp_ioctl.o fs/ioctl.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.pm34xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pm34xx=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(pm34xx)" -c -o arch/arm/mach-omap2/.tmp_=
pm34xx.o arch/arm/mach-omap2/pm34xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.sleep34xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb=
-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn=
-deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include=
 asm/unified.h -msoft-float     -Wa,-march=3Darmv7-a+sec   -c -o arch/arm/m=
ach-omap2/sleep34xx.o arch/arm/mach-omap2/sleep34xx.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.cpuidle34xx.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(c=
puidle34xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(cpuidle34xx)" -c -o arch/arm/m=
ach-omap2/.tmp_cpuidle34xx.o arch/arm/mach-omap2/cpuidle34xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.cpuidle33xx.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(c=
puidle33xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(cpuidle33xx)" -c -o arch/arm/m=
ach-omap2/.tmp_cpuidle33xx.o arch/arm/mach-omap2/cpuidle33xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.pm33xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pm33xx=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(pm33xx)" -c -o arch/arm/mach-omap2/.tmp_=
pm33xx.o arch/arm/mach-omap2/pm33xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.sleep33xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -D__ASSEMBLY__ -mabi=3Daapcs-linux -mno-thumb=
-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn=
-deprecated -Wa,-mthumb -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a  -include=
 asm/unified.h -msoft-float     -Wa,-march=3Darmv7-a+sec   -c -o arch/arm/m=
ach-omap2/sleep33xx.o arch/arm/mach-omap2/sleep33xx.S
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.pm-debug.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pm_d=
ebug)"  -D"KBUILD_MODNAME=3DKBUILD_STR(pm_debug)" -c -o arch/arm/mach-omap2=
/.tmp_pm-debug.o arch/arm/mach-omap2/pm-debug.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.prm_common.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(pr=
m_common)"  -D"KBUILD_MODNAME=3DKBUILD_STR(prm_common)" -c -o arch/arm/mach=
-omap2/.tmp_prm_common.o arch/arm/mach-omap2/prm_common.c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o ipc/built-in.o ipc/util.o ip=
c/msgutil.o ipc/msg.o ipc/sem.o ipc/shm.o ipc/ipcns_notifier.o ipc/syscall.=
o ipc/ipc_sysctl.o ipc/mqueue.o ipc/namespace.o ipc/mq_sysctl.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.prcm.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angs=
trom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnu=
eabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/incl=
ude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linu=
x/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iar=
ch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-=
format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-a=
sm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mi=
mplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -marc=
h=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protec=
tor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-s=
tatement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_=
ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(prcm)"  =
-D"KBUILD_MODNAME=3DKBUILD_STR(prcm)" -c -o arch/arm/mach-omap2/.tmp_prcm.o=
 arch/arm/mach-omap2/prcm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.cm2xxx_3xxx.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(c=
m2xxx_3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(cm2xxx_3xxx)" -c -o arch/arm/m=
ach-omap2/.tmp_cm2xxx_3xxx.o arch/arm/mach-omap2/cm2xxx_3xxx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.readdir.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-e=
glibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-a=
ngstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm=
/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v201=
2_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+=
gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D=
__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-om=
ap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-ali=
asing -fno-common -Werror-implicit-function-declaration -Wno-format-securit=
y -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daap=
cs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Da=
lways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -m=
soft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unuse=
d-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-=
pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D=
"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(readdir)"  -D"KBUILD_M=
ODNAME=3DKBUILD_STR(readdir)" -c -o fs/.tmp_readdir.o fs/readdir.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.select.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-eg=
libc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-an=
gstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/=
include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D_=
_KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-oma=
p/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alia=
sing -fno-common -Werror-implicit-function-declaration -Wno-format-security=
 -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapc=
s-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dal=
ways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -ms=
oft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused=
-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-p=
ointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"=
KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(select)"  -D"KBUILD_MOD=
NAME=3DKBUILD_STR(select)" -c -o fs/.tmp_select.o fs/select.c
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o security/keys/built-in.o sec=
urity/keys/gc.o security/keys/key.o security/keys/keyring.o security/keys/k=
eyctl.o security/keys/permission.o security/keys/process_keys.o security/ke=
ys/request_key.o security/keys/request_key_auth.o security/keys/user_define=
d.o security/keys/proc.o security/keys/sysctl.o=20
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o security/built-in.o security=
/keys/built-in.o security/commoncap.o security/min_addr.o security/security=
.o security/capability.o security/inode.o security/lsm_audit.o security/dev=
ice_cgroup.o=20
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.prm2xxx_3xxx.o.d  -nostdinc -isystem /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-l=
inux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/=
arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/lin=
ux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/incl=
ude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/incl=
ude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declarati=
on -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwar=
f2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb=
 -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(prm2xxx_3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(prm2xxx_3xxx)" -c -o arch/=
arm/mach-omap2/.tmp_prm2xxx_3xxx.o arch/arm/mach-omap2/prm2xxx_3xxx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.fifo.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(fifo)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(fifo)" -c -o fs/.tmp_fifo.o fs/fifo.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.vc3xxx_data.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(v=
c3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(vc3xxx_data)" -c -o arch/arm/m=
ach-omap2/.tmp_vc3xxx_data.o arch/arm/mach-omap2/vc3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.vp3xxx_data.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(v=
p3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(vp3xxx_data)" -c -o arch/arm/m=
ach-omap2/.tmp_vp3xxx_data.o arch/arm/mach-omap2/vp3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.cminst44xx.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(cm=
inst44xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(cminst44xx)" -c -o arch/arm/mach=
-omap2/.tmp_cminst44xx.o arch/arm/mach-omap2/cminst44xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.voltage.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(volta=
ge)"  -D"KBUILD_MODNAME=3DKBUILD_STR(voltage)" -c -o arch/arm/mach-omap2/.t=
mp_voltage.o arch/arm/mach-omap2/voltage.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.vc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vc)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(vc)" -c -o arch/arm/mach-omap2/.tmp_vc.o arch/a=
rm/mach-omap2/vc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.vp.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnuea=
bi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-ps=
p-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/includ=
e -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/=
kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch=
/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-fo=
rmat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm=
 -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimp=
licit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(vp)"  -D"=
KBUILD_MODNAME=3DKBUILD_STR(vp)" -c -o arch/arm/mach-omap2/.tmp_vp.o arch/a=
rm/mach-omap2/vp.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.voltagedomains33xx_data.o.d  -nostdinc -isystem /OE/angs=
trom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a=
-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/=
angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-g=
nueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f0=
1/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE=
/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-=
gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f=
01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach=
-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototyp=
es -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-functio=
n-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -mar=
m -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tab=
les -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_A=
RM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D102=
4 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -W=
declaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconser=
ve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3D=
KBUILD_STR(voltagedomains33xx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(voltag=
edomains33xx_data)" -c -o arch/arm/mach-omap2/.tmp_voltagedomains33xx_data.=
o arch/arm/mach-omap2/voltagedomains33xx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.voltagedomains3xxx_data.o.d  -nostdinc -isystem /OE/angs=
trom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a=
-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/=
angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-g=
nueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f0=
1/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE=
/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-=
gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f=
01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach=
-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototyp=
es -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-functio=
n-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -mar=
m -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tab=
les -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_A=
RM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D102=
4 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -W=
declaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconser=
ve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3D=
KBUILD_STR(voltagedomains3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(voltag=
edomains3xxx_data)" -c -o arch/arm/mach-omap2/.tmp_voltagedomains3xxx_data.=
o arch/arm/mach-omap2/voltagedomains3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.dcache.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-eg=
libc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-an=
gstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/=
include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012=
_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+g=
itr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D_=
_KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-oma=
p/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alia=
sing -fno-common -Werror-implicit-function-declaration -Wno-format-security=
 -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapc=
s-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dal=
ways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -ms=
oft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused=
-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-p=
ointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"=
KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dcache)"  -D"KBUILD_MOD=
NAME=3DKBUILD_STR(dcache)" -c -o fs/.tmp_dcache.o fs/dcache.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.inode.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egl=
ibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-ang=
strom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/i=
nclude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_=
x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gi=
tr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__=
KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap=
/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -fno-common -Werror-implicit-function-declaration -Wno-format-security =
-fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs=
-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalw=
ays -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -mso=
ft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-=
but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-po=
inter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"K=
BUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(inode)"  -D"KBUILD_MODNA=
ME=3DKBUILD_STR(inode)" -c -o fs/.tmp_inode.o fs/inode.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.attr.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x-egli=
bc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angs=
trom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-=
eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr=
720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/arm/in=
clude/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+git=
r720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h -D__K=
ERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/=
include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasi=
ng -fno-common -Werror-implicit-function-declaration -Wno-format-security -=
fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-=
linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalwa=
ys -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msof=
t-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-unused-b=
ut-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -Wno-poi=
nter-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KB=
UILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(attr)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(attr)" -c -o fs/.tmp_attr.o fs/attr.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomain.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(p=
owerdomain)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomain)" -c -o arch/arm/m=
ach-omap2/.tmp_powerdomain.o arch/arm/mach-omap2/powerdomain.c
/bin/sh: line 1: 14063 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o fs/pipe.o fs/.tmp_pipe.o -T fs/.tmp_pipe.ver
make[1]: *** [fs/pipe.o] Error 139
make[1]: *** Waiting for unfinished jobs....
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,fs=
/.bad_inode.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angstrom_v2012_x=
-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm=
-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-angstrom_v20=
12_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i=
+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/include -Iarch/a=
rm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-angstrom_v2=
012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11=
i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux/kconfig.h =
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-=
omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-a=
liasing -fno-common -Werror-implicit-function-declaration -Wno-format-secur=
ity -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Da=
apcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mimplicit-it=
=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protector -Wno-u=
nused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-statement -=
Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  =
  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(bad_inode)"  -D"KB=
UILD_MODNAME=3DKBUILD_STR(bad_inode)" -c -o fs/.tmp_bad_inode.o fs/bad_inod=
e.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomain-common.o.d  -nostdinc -isystem /OE/angstrom/=
build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angs=
trom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angst=
rom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueab=
i/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git=
/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angs=
trom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnuea=
bi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/gi=
t/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap=
2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -W=
no-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-dec=
laration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fn=
o-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -=
mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_AR=
CH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fn=
o-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdecla=
ration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-st=
ack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUIL=
D_STR(powerdomain_common)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomain_comm=
on)" -c -o arch/arm/mach-omap2/.tmp_powerdomain-common.o arch/arm/mach-omap=
2/powerdomain-common.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomain2xxx_3xxx.o.d  -nostdinc -isystem /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-an=
gstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/ang=
strom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnue=
abi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/g=
it/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-om=
ap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-d=
eclaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -=
fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables=
 -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -=
fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdec=
laration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-=
stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBU=
ILD_STR(powerdomain2xxx_3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomain2=
xxx_3xxx)" -c -o arch/arm/mach-omap2/.tmp_powerdomain2xxx_3xxx.o arch/arm/m=
ach-omap2/powerdomain2xxx_3xxx.c
/bin/sh: line 1: 14083 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o fs/readdir.o fs/.tmp_readdir.o -T fs/.tmp_readdir.ver
make[1]: *** [fs/readdir.o] Error 139
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomains3xxx_data.o.d  -nostdinc -isystem /OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-a=
ngstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gn=
ueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01=
/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-o=
map2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes=
 -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-=
declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm =
-fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-table=
s -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM=
_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 =
-fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wde=
claration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve=
-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKB=
UILD_STR(powerdomains3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomai=
ns3xxx_data)" -c -o arch/arm/mach-omap2/.tmp_powerdomains3xxx_data.o arch/a=
rm/mach-omap2/powerdomains3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomains2xxx_3xxx_data.o.d  -nostdinc -isystem /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/arm=
v7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/=
OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linu=
x-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d7=
2f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include =
/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-lin=
ux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d=
72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/m=
ach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-proto=
types -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-func=
tion-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -=
marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-=
tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINU=
X_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D=
1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer=
 -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fcon=
serve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=
=3DKBUILD_STR(powerdomains2xxx_3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(=
powerdomains2xxx_3xxx_data)" -c -o arch/arm/mach-omap2/.tmp_powerdomains2xx=
x_3xxx_data.o arch/arm/mach-omap2/powerdomains2xxx_3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.prminst44xx.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(p=
rminst44xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(prminst44xx)" -c -o arch/arm/m=
ach-omap2/.tmp_prminst44xx.o arch/arm/mach-omap2/prminst44xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomain44xx.o.d  -nostdinc -isystem /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstro=
m-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/ar=
ch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/=
linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/i=
nclude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/i=
nclude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-=
trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declar=
ation -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-d=
warf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mth=
umb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH_=
_=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-s=
tack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarat=
ion-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack=
 -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_S=
TR(powerdomain44xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomain44xx)" -c -=
o arch/arm/mach-omap2/.tmp_powerdomain44xx.o arch/arm/mach-omap2/powerdomai=
n44xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.powerdomains33xx_data.o.d  -nostdinc -isystem /OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-a=
ngstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gn=
ueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01=
/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-o=
map2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes=
 -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-=
declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm =
-fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-table=
s -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM=
_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 =
-fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wde=
claration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve=
-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKB=
UILD_STR(powerdomains33xx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(powerdomai=
ns33xx_data)" -c -o arch/arm/mach-omap2/.tmp_powerdomains33xx_data.o arch/a=
rm/mach-omap2/powerdomains33xx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomain.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(c=
lockdomain)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clockdomain)" -c -o arch/arm/m=
ach-omap2/.tmp_clockdomain.o arch/arm/mach-omap2/clockdomain.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomain2xxx_3xxx.o.d  -nostdinc -isystem /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-an=
gstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/ang=
strom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnue=
abi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/g=
it/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-om=
ap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-d=
eclaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -=
fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables=
 -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -=
fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdec=
laration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-=
stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBU=
ILD_STR(clockdomain2xxx_3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clockdomain2=
xxx_3xxx)" -c -o arch/arm/mach-omap2/.tmp_clockdomain2xxx_3xxx.o arch/arm/m=
ach-omap2/clockdomain2xxx_3xxx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomains2xxx_3xxx_data.o.d  -nostdinc -isystem /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/arm=
v7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/=
OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linu=
x-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d7=
2f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include =
/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-lin=
ux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d=
72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/m=
ach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-proto=
types -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-func=
tion-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -=
marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-=
tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINU=
X_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D=
1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer=
 -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fcon=
serve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=
=3DKBUILD_STR(clockdomains2xxx_3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(=
clockdomains2xxx_3xxx_data)" -c -o arch/arm/mach-omap2/.tmp_clockdomains2xx=
x_3xxx_data.o arch/arm/mach-omap2/clockdomains2xxx_3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomains3xxx_data.o.d  -nostdinc -isystem /OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-a=
ngstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gn=
ueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01=
/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-o=
map2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes=
 -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-=
declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm =
-fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-table=
s -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM=
_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 =
-fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wde=
claration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve=
-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKB=
UILD_STR(clockdomains3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clockdomai=
ns3xxx_data)" -c -o arch/arm/mach-omap2/.tmp_clockdomains3xxx_data.o arch/a=
rm/mach-omap2/clockdomains3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomain44xx.o.d  -nostdinc -isystem /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstro=
m-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/ar=
ch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/=
linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/i=
nclude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/i=
nclude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-=
trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declar=
ation -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-d=
warf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mth=
umb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH_=
_=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-s=
tack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarat=
ion-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack=
 -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_S=
TR(clockdomain44xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clockdomain44xx)" -c -=
o arch/arm/mach-omap2/.tmp_clockdomain44xx.o arch/arm/mach-omap2/clockdomai=
n44xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clockdomains33xx_data.o.d  -nostdinc -isystem /OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-a=
ngstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/a=
ngstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gn=
ueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01=
/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-o=
map2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes=
 -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-=
declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm =
-fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-table=
s -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM=
_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 =
-fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wde=
claration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve=
-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKB=
UILD_STR(clockdomains33xx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clockdomai=
ns33xx_data)" -c -o arch/arm/mach-omap2/.tmp_clockdomains33xx_data.o arch/a=
rm/mach-omap2/clockdomains33xx_data.c
/bin/sh: line 1: 14179 Segmentation fault      arm-angstrom-linux-gnueabi-l=
d --sysroot=3D/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beagl=
ebone -r -o fs/select.o fs/.tmp_select.o -T fs/.tmp_select.ver
make[1]: *** [fs/select.o] Error 139
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clock)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(clock)" -c -o arch/arm/mach-omap2/.tmp_clo=
ck.o arch/arm/mach-omap2/clock.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock_common_data.o.d  -nostdinc -isystem /OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angst=
rom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi=
/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/=
arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angst=
rom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueab=
i/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git=
/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2=
/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wn=
o-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-decl=
aration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno=
-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -m=
thumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARC=
H__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno=
-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclar=
ation-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-sta=
ck -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD=
_STR(clock_common_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock_common_data)=
" -c -o arch/arm/mach-omap2/.tmp_clock_common_data.o arch/arm/mach-omap2/cl=
ock_common_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clkt_dpll.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clk=
t_dpll)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clkt_dpll)" -c -o arch/arm/mach-om=
ap2/.tmp_clkt_dpll.o arch/arm/mach-omap2/clkt_dpll.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clkt_clksel.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(c=
lkt_clksel)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clkt_clksel)" -c -o arch/arm/m=
ach-omap2/.tmp_clkt_clksel.o arch/arm/mach-omap2/clkt_clksel.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock3xxx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clo=
ck3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock3xxx)" -c -o arch/arm/mach-om=
ap2/.tmp_clock3xxx.o arch/arm/mach-omap2/clock3xxx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock34xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clo=
ck34xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock34xx)" -c -o arch/arm/mach-om=
ap2/.tmp_clock34xx.o arch/arm/mach-omap2/clock34xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clkt34xx_dpll3m2.o.d  -nostdinc -isystem /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstr=
om-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/=
linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/a=
rch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi=
/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/=
include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/=
include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno=
-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-decla=
ration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-=
dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mt=
humb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH=
__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-=
stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclara=
tion-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stac=
k -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_=
STR(clkt34xx_dpll3m2)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clkt34xx_dpll3m2)" -=
c -o arch/arm/mach-omap2/.tmp_clkt34xx_dpll3m2.o arch/arm/mach-omap2/clkt34=
xx_dpll3m2.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock3517.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clo=
ck3517)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock3517)" -c -o arch/arm/mach-om=
ap2/.tmp_clock3517.o arch/arm/mach-omap2/clock3517.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock36xx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clo=
ck36xx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock36xx)" -c -o arch/arm/mach-om=
ap2/.tmp_clock36xx.o arch/arm/mach-omap2/clock36xx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.dpll3xxx.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(dpll=
3xxx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(dpll3xxx)" -c -o arch/arm/mach-omap2=
/.tmp_dpll3xxx.o arch/arm/mach-omap2/dpll3xxx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock3xxx_data.o.d  -nostdinc -isystem /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom=
-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/=
build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/li=
nux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arc=
h/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/in=
clude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/in=
clude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-t=
rigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declara=
tion -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dw=
arf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthu=
mb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(clock3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock3xxx_data)" -c -o a=
rch/arm/mach-omap2/.tmp_clock3xxx_data.o arch/arm/mach-omap2/clock3xxx_data=
.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clkt_iclk.o.d  -nostdinc -isystem /OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linu=
x-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm=
/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include=
/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include=
 -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration =
-Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-=
cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -W=
a,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 =
-march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-p=
rotector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-af=
ter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_=
HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(clk=
t_iclk)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clkt_iclk)" -c -o arch/arm/mach-om=
ap2/.tmp_clkt_iclk.o arch/arm/mach-omap2/clkt_iclk.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.clock33xx_data.o.d  -nostdinc -isystem /OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom=
-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/=
build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/li=
nux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arc=
h/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/in=
clude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/in=
clude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-t=
rigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declara=
tion -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dw=
arf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthu=
mb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(clock33xx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(clock33xx_data)" -c -o a=
rch/arm/mach-omap2/.tmp_clock33xx_data.o arch/arm/mach-omap2/clock33xx_data=
.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod_2xxx_3xxx_ipblock_data.o.d  -nostdinc -isyste=
m /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/=
lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/incl=
ude -I/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstr=
om-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698c=
b6816d72f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclude  -i=
nclude /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angst=
rom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698=
cb6816d72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarc=
h/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstric=
t-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implic=
it-function-declaration -Wno-format-security -fno-delete-null-pointer-check=
s -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -f=
unwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -=
D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-=
than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-=
pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflo=
w -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_B=
ASENAME=3DKBUILD_STR(omap_hwmod_2xxx_3xxx_ipblock_data)"  -D"KBUILD_MODNAME=
=3DKBUILD_STR(omap_hwmod_2xxx_3xxx_ipblock_data)" -c -o arch/arm/mach-omap2=
/.tmp_omap_hwmod_2xxx_3xxx_ipblock_data.o arch/arm/mach-omap2/omap_hwmod_2x=
xx_3xxx_ipblock_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod_3xxx_data.o.d  -nostdinc -isystem /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-an=
gstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/ang=
strom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnue=
abi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/g=
it/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-om=
ap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-d=
eclaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -=
fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables=
 -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -=
fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdec=
laration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-=
stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBU=
ILD_STR(omap_hwmod_3xxx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_hwmod_3=
xxx_data)" -c -o arch/arm/mach-omap2/.tmp_omap_hwmod_3xxx_data.o arch/arm/m=
ach-omap2/omap_hwmod_3xxx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod_2xxx_3xxx_interconnect_data.o.d  -nostdinc -i=
system /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux=
/usr/lib/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1=
/include -I/OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-a=
ngstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31=
c698cb6816d72f01/git/arch/arm/include -Iarch/arm/include/generated -Iinclud=
e  -include /OE/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-=
angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b3=
1c698cb6816d72f01/git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian =
-Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -W=
strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-i=
mplicit-function-declaration -Wno-format-security -fno-delete-null-pointer-=
checks -Os -marm -fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwo=
rk -funwind-tables -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-depreca=
ted -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-la=
rger-than=3D1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-f=
rame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-ov=
erflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBU=
ILD_BASENAME=3DKBUILD_STR(omap_hwmod_2xxx_3xxx_interconnect_data)"  -D"KBUI=
LD_MODNAME=3DKBUILD_STR(omap_hwmod_2xxx_3xxx_interconnect_data)" -c -o arch=
/arm/mach-omap2/.tmp_omap_hwmod_2xxx_3xxx_interconnect_data.o arch/arm/mach=
-omap2/omap_hwmod_2xxx_3xxx_interconnect_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_hwmod_33xx_data.o.d  -nostdinc -isystem /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-an=
gstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/ang=
strom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnue=
abi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/g=
it/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-om=
ap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-d=
eclaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -=
fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables=
 -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -=
fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdec=
laration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-=
stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBU=
ILD_STR(omap_hwmod_33xx_data)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_hwmod_3=
3xx_data)" -c -o arch/arm/mach-omap2/.tmp_omap_hwmod_33xx_data.o arch/arm/m=
ach-omap2/omap_hwmod_33xx_data.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_l3_smx.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(o=
map_l3_smx)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_l3_smx)" -c -o arch/arm/m=
ach-omap2/.tmp_omap_l3_smx.o arch/arm/mach-omap2/omap_l3_smx.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.mailbox.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-=
gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/i=
nclude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/l=
inux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -=
Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -W=
no-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cf=
i-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,=
-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -m=
arch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pro=
tector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-afte=
r-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HA=
VE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(mailb=
ox)"  -D"KBUILD_MODNAME=3DKBUILD_STR(mailbox_mach)" -c -o arch/arm/mach-oma=
p2/.tmp_mailbox.o arch/arm/mach-omap2/mailbox.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.iommu2.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-an=
gstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-g=
nueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/in=
clude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti3=
3x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -I=
arch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=
 -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wn=
o-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi=
-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-=
mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -ma=
rch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prot=
ector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after=
-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAV=
E_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(iommu2=
)"  -D"KBUILD_MODNAME=3DKBUILD_STR(iommu2)" -c -o arch/arm/mach-omap2/.tmp_=
iommu2.o arch/arm/mach-omap2/iommu2.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap-iommu.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(om=
ap_iommu)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_iommu)" -c -o arch/arm/mach=
-omap2/.tmp_omap-iommu.o arch/arm/mach-omap2/omap-iommu.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.i2c.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-angst=
rom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp-a=
ngstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-p=
sp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inclu=
de -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-=
psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/linux=
/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarc=
h/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-f=
ormat-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-as=
m -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-mim=
plicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=
=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-protect=
or -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-st=
atement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_A=
SM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(i2c)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(i2c)" -c -o arch/arm/mach-omap2/.tmp_i2c.o arc=
h/arm/mach-omap2/i2c.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.board-generic.o.d  -nostdinc -isystem /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-=
linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/lin=
ux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch=
/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/=
build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/li=
nux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inc=
lude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inc=
lude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-tr=
igraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declarat=
ion -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwa=
rf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthum=
b -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(board_generic)"  -D"KBUILD_MODNAME=3DKBUILD_STR(board_generic)" -c -o arc=
h/arm/mach-omap2/.tmp_board-generic.o arch/arm/mach-omap2/board-generic.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.board-omap3beagle.o.d  -nostdinc -isystem /OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angst=
rom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi=
/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/=
arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angst=
rom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueab=
i/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git=
/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2=
/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wn=
o-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-decl=
aration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno=
-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -m=
thumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARC=
H__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno=
-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclar=
ation-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-sta=
ck -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD=
_STR(board_omap3beagle)"  -D"KBUILD_MODNAME=3DKBUILD_STR(board_omap3beagle)=
" -c -o arch/arm/mach-omap2/.tmp_board-omap3beagle.o arch/arm/mach-omap2/bo=
ard-omap3beagle.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.board-ti8168evm.o.d  -nostdinc -isystem /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstro=
m-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/ar=
ch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/=
linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/i=
nclude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/i=
nclude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-=
trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declar=
ation -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-d=
warf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mth=
umb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH_=
_=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-s=
tack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarat=
ion-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack=
 -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_S=
TR(board_ti8168evm)"  -D"KBUILD_MODNAME=3DKBUILD_STR(board_ti8168evm)" -c -=
o arch/arm/mach-omap2/.tmp_board-ti8168evm.o arch/arm/mach-omap2/board-ti81=
68evm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.board-am335xevm.o.d  -nostdinc -isystem /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstro=
m-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom=
/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/l=
inux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/ar=
ch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/=
linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/i=
nclude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/i=
nclude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-=
trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declar=
ation -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-d=
warf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mth=
umb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH_=
_=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-s=
tack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarat=
ion-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack=
 -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_S=
TR(board_am335xevm)"  -D"KBUILD_MODNAME=3DKBUILD_STR(board_am335xevm)" -c -=
o arch/arm/mach-omap2/.tmp_board-am335xevm.o arch/arm/mach-omap2/board-am33=
5xevm.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.hsmmc.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-ang=
strom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux-gn=
ueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/tmp=
-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x=
-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/inc=
lude -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33=
x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/lin=
ux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Ia=
rch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs =
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno=
-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-cfi-=
asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa,-m=
implicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -mar=
ch=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-prote=
ctor -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-after-=
statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE=
_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(hsmmc)"=
  -D"KBUILD_MODNAME=3DKBUILD_STR(hsmmc)" -c -o arch/arm/mach-omap2/.tmp_hsm=
mc.o arch/arm/mach-omap2/hsmmc.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.usb-musb.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(usb_=
musb)"  -D"KBUILD_MODNAME=3DKBUILD_STR(usb_musb)" -c -o arch/arm/mach-omap2=
/.tmp_usb-musb.o arch/arm/mach-omap2/usb-musb.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.omap_phy_internal.o.d  -nostdinc -isystem /OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angst=
rom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstr=
om/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi=
/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/=
arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angst=
rom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueab=
i/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git=
/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2=
/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wn=
o-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-decl=
aration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno=
-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -m=
thumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARC=
H__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno=
-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclar=
ation-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-sta=
ck -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD=
_STR(omap_phy_internal)"  -D"KBUILD_MODNAME=3DKBUILD_STR(omap_phy_internal)=
" -c -o arch/arm/mach-omap2/.tmp_omap_phy_internal.o arch/arm/mach-omap2/om=
ap_phy_internal.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.usb-host.o.d  -nostdinc -isystem /OE/angstrom/build/tmp-=
angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-linux=
-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/build/=
tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti=
33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/arm/=
include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-t=
i33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/include/=
linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include =
-Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -=
Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2-c=
fi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -Wa=
,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -=
march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-pr=
otector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-aft=
er-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_H=
AVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(usb_=
host)"  -D"KBUILD_MODNAME=3DKBUILD_STR(usb_host)" -c -o arch/arm/mach-omap2=
/.tmp_usb-host.o arch/arm/mach-omap2/usb-host.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.gpmc-smc91x.o.d  -nostdinc -isystem /OE/angstrom/build/t=
mp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-li=
nux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/a=
rm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bu=
ild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linu=
x-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inclu=
de/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inclu=
de -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trig=
raphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaratio=
n -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf=
2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb =
-Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D=
7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-=
after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DC=
C_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(g=
pmc_smc91x)"  -D"KBUILD_MODNAME=3DKBUILD_STR(gpmc_smc91x)" -c -o arch/arm/m=
ach-omap2/.tmp_gpmc-smc91x.o arch/arm/mach-omap2/gpmc-smc91x.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.gpmc-smsc911x.o.d  -nostdinc -isystem /OE/angstrom/build=
/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-=
linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/b=
uild/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/lin=
ux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch=
/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/=
build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/li=
nux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/inc=
lude/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/inc=
lude -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-tr=
igraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declarat=
ion -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwa=
rf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthum=
b -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=
=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-st=
ack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclarati=
on-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack =
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_ST=
R(gpmc_smsc911x)"  -D"KBUILD_MODNAME=3DKBUILD_STR(gpmc_smsc911x)" -c -o arc=
h/arm/mach-omap2/.tmp_gpmc-smsc911x.o arch/arm/mach-omap2/gpmc-smsc911x.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.common-board-devices.o.d  -nostdinc -isystem /OE/angstro=
m/build/tmp-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-an=
gstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/ang=
strom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnue=
abi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/g=
it/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /OE/an=
gstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnu=
eabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/=
git/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-om=
ap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-d=
eclaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -=
fno-dwarf2-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables=
 -mthumb -Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_=
ARCH__=3D7 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -=
fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdec=
laration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-=
stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBU=
ILD_STR(common_board_devices)"  -D"KBUILD_MODNAME=3DKBUILD_STR(common_board=
_devices)" -c -o arch/arm/mach-omap2/.tmp_common-board-devices.o arch/arm/m=
ach-omap2/common-board-devices.c
  arm-angstrom-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=3D/O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/sysroots/beaglebone -Wp,-MD,ar=
ch/arm/mach-omap2/.twl-common.o.d  -nostdinc -isystem /OE/angstrom/build/tm=
p-angstrom_v2012_x-eglibc/sysroots/x86_64-linux/usr/lib/armv7a-angstrom-lin=
ux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.7.1/include -I/OE/angstrom/buil=
d/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-=
ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/arch/ar=
m/include -Iarch/arm/include/generated -Iinclude  -include /OE/angstrom/bui=
ld/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux=
-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72f01/git/includ=
e/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/includ=
e -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigr=
aphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=
 -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-dwarf2=
-cfi-asm -mabi=3Daapcs-linux -mno-thumb-interwork -funwind-tables -mthumb -=
Wa,-mimplicit-it=3Dalways -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7=
 -march=3Darmv7-a -msoft-float -Uarm -Wframe-larger-than=3D1024 -fno-stack-=
protector -Wno-unused-but-set-variable -fomit-frame-pointer -Wdeclaration-a=
fter-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC=
_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASENAME=3DKBUILD_STR(tw=
l_common)"  -D"KBUILD_MODNAME=3DKBUILD_STR(twl_common)" -c -o arch/arm/mach=
-omap2/.tmp_twl-common.o arch/arm/mach-omap2/twl-common.c
  arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstro=
m_v2012_x-eglibc/sysroots/beaglebone    -r -o arch/arm/mach-omap2/mailbox_m=
ach.o arch/arm/mach-omap2/mailbox.o=20
make: *** [fs] Error 2
arch/arm/mach-omap2/board-am335xevm.c: In function 'beaglebone_cape_setup':
arch/arm/mach-omap2/board-am335xevm.c:2332:4: warning: ISO C90 forbids mixe=
d declarations and code [-Wdeclaration-after-statement]
   arm-angstrom-linux-gnueabi-ld  --sysroot=3D/OE/angstrom/build/tmp-angstr=
om_v2012_x-eglibc/sysroots/beaglebone    -r -o arch/arm/mach-omap2/built-in=
.o arch/arm/mach-omap2/id.o arch/arm/mach-omap2/io.o arch/arm/mach-omap2/co=
ntrol.o arch/arm/mach-omap2/mux.o arch/arm/mach-omap2/devices.o arch/arm/ma=
ch-omap2/serial.o arch/arm/mach-omap2/gpmc.o arch/arm/mach-omap2/timer.o ar=
ch/arm/mach-omap2/pm.o arch/arm/mach-omap2/common.o arch/arm/mach-omap2/gpi=
o.o arch/arm/mach-omap2/dma.o arch/arm/mach-omap2/wd_timer.o arch/arm/mach-=
omap2/display.o arch/arm/mach-omap2/irq.o arch/arm/mach-omap2/sdrc.o arch/a=
rm/mach-omap2/omap_hwmod.o arch/arm/mach-omap2/omap_hwmod_common_data.o arc=
h/arm/mach-omap2/omap-smc.o arch/arm/mach-omap2/omap-secure.o arch/arm/mach=
-omap2/mcbsp.o arch/arm/mach-omap2/omap_twl.o arch/arm/mach-omap2/sram34xx.=
o arch/arm/mach-omap2/mux34xx.o arch/arm/mach-omap2/mux33xx.o arch/arm/mach=
-omap2/opp.o arch/arm/mach-omap2/opp3xxx_data.o arch/arm/mach-omap2/pm34xx.=
o arch/arm/mach-omap2/sleep34xx.o arch/arm/mach-omap2/cpuidle34xx.o arch/ar=
m/mach-omap2/cpuidle33xx.o arch/arm/mach-omap2/pm33xx.o arch/arm/mach-omap2=
/sleep33xx.o arch/arm/mach-omap2/pm-debug.o arch/arm/mach-omap2/prm_common.=
o arch/arm/mach-omap2/prcm.o arch/arm/mach-omap2/cm2xxx_3xxx.o arch/arm/mac=
h-omap2/prm2xxx_3xxx.o arch/arm/mach-omap2/vc3xxx_data.o arch/arm/mach-omap=
2/vp3xxx_data.o arch/arm/mach-omap2/cminst44xx.o arch/arm/mach-omap2/voltag=
e.o arch/arm/mach-omap2/vc.o arch/arm/mach-omap2/vp.o arch/arm/mach-omap2/v=
oltagedomains3xxx_data.o arch/arm/mach-omap2/voltagedomains33xx_data.o arch=
/arm/mach-omap2/powerdomain.o arch/arm/mach-omap2/powerdomain-common.o arch=
/arm/mach-omap2/powerdomain2xxx_3xxx.o arch/arm/mach-omap2/powerdomains3xxx=
_data.o arch/arm/mach-omap2/powerdomains2xxx_3xxx_data.o arch/arm/mach-omap=
2/prminst44xx.o arch/arm/mach-omap2/powerdomain44xx.o arch/arm/mach-omap2/p=
owerdomains33xx_data.o arch/arm/mach-omap2/clockdomain.o arch/arm/mach-omap=
2/clockdomain2xxx_3xxx.o arch/arm/mach-omap2/clockdomains2xxx_3xxx_data.o a=
rch/arm/mach-omap2/clockdomains3xxx_data.o arch/arm/mach-omap2/clockdomain4=
4xx.o arch/arm/mach-omap2/clockdomains33xx_data.o arch/arm/mach-omap2/clock=
.o arch/arm/mach-omap2/clock_common_data.o arch/arm/mach-omap2/clkt_dpll.o =
arch/arm/mach-omap2/clkt_clksel.o arch/arm/mach-omap2/clock3xxx.o arch/arm/=
mach-omap2/clock34xx.o arch/arm/mERROR: Function failed: do_compile (see /O=
E/angstrom/build/tmp-angstrom_v2012_x-eglibc/work/beaglebone-angstrom-linux=
-gnueabi/linux-ti33x-psp-3.2-r11i+gitr720e07b4c1f687b61b147b31c698cb6816d72=
f01/temp/log.do_compile.11124 for further information)
ach-omap2/clkt34xx_dpll3m2.o arch/arm/mach-omap2/clock3517.o arch/arm/mach-=
omap2/clock36xx.o arch/arm/mach-omap2/dpll3xxx.o arch/arm/mach-omap2/clock3=
xxx_data.o arch/arm/mach-omap2/clkt_iclk.o arch/arm/mach-omap2/clock33xx_da=
ta.o arch/arm/mach-omap2/omap_hwmod_2xxx_3xxx_ipblock_data.o arch/arm/mach-=
omap2/omap_hwmod_2xxx_3xxx_interconnect_data.o arch/arm/mach-omap2/omap_hwm=
od_3xxx_data.o arch/arm/mach-omap2/omap_hwmod_33xx_data.o arch/arm/mach-oma=
p2/omap_l3_smx.o arch/arm/mach-omap2/mailbox_mach.o arch/arm/mach-omap2/iom=
mu2.o arch/arm/mach-omap2/omap-iommu.o arch/arm/mach-omap2/i2c.o arch/arm/m=
ach-omap2/board-generic.o arch/arm/mach-omap2/board-omap3beagle.o arch/arm/=
mach-omap2/board-ti8168evm.o arch/arm/mach-omap2/board-am335xevm.o arch/arm=
/mach-omap2/hsmmc.o arch/arm/mach-omap2/usb-musb.o arch/arm/mach-omap2/omap=
_phy_internal.o arch/arm/mach-omap2/usb-host.o arch/arm/mach-omap2/gpmc-smc=
91x.o arch/arm/mach-omap2/gpmc-smsc911x.o arch/arm/mach-omap2/common-board-=
devices.o arch/arm/mach-omap2/twl-common.o=20
ERROR: oe_runmake failed

--WIyZ46R2i8wDzkSu--
