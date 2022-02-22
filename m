Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.503.1645570663899886991
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 14:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D724040C2E;
	Tue, 22 Feb 2022 22:57:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_TY39euXcXA; Tue, 22 Feb 2022 22:57:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7877C40A77;
	Tue, 22 Feb 2022 22:57:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 30A2A174788; Tue, 22 Feb 2022 17:57:34 -0500 (EST)
Date: Tue, 22 Feb 2022 17:57:34 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: sidraya.bj@pathpartnertech.com
Cc: meta-ti@lists.yoctoproject.org, yogeshs@ti.com, praneeth@ti.com,
	d-huang@ti.com, prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	Angela Stegmaier <angelabaker@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [meta-ti] [dunfell/master][PATCH] viddec-test-app: Add the viddec-test-app recipe
Message-ID: <20220222225727.GU26229@denix.org>
References: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
In-Reply-To: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Groupsio-MsgNum: 14477
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

viddec-test-app now breaks in master against the latest ffmpeg using gcc 11.2. 
Can you please take a look?

I'm seeing these errors (and full log is also attached):


../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
   49 |         AVBitStreamFilterContext *bsf;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c: In function 'find_stream':
../git/demux.c:64:36: error: 'AVStream' has no member named 'codec'
   64 |                 if (afc->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO && !st)
      |                                    ^~
../git/demux.c: In function 'open_stream':
../git/demux.c:78:32: error: 'AVStream' has no member named 'codec'
   78 |         AVCodecContext *cc = st->codec;
      |                                ^~
../git/demux.c:79:9: error: unknown type name 'AVBitStreamFilterContext'
   79 |         AVBitStreamFilterContext *bsf = NULL;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:94:23: error: implicit declaration of function 'av_bitstream_filter_init' [-Werror=implicit-function-declaration]
   94 |                 bsf = av_bitstream_filter_init("h264_mp4toannexb");
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:94:23: warning: nested extern declaration of 'av_bitstream_filter_init' [-Wnested-externs]
../git/demux.c:94:21: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   94 |                 bsf = av_bitstream_filter_init("h264_mp4toannexb");
      |                     ^
../git/demux.c: In function 'demux_init':
../git/demux.c:124:9: error: implicit declaration of function 'av_register_all' [-Werror=implicit-function-declaration]
  124 |         av_register_all();
      |         ^~~~~~~~~~~~~~~
../git/demux.c:124:9: warning: nested extern declaration of 'av_register_all' [-Wnested-externs]
../git/demux.c:125:9: error: implicit declaration of function 'avcodec_register_all' [-Werror=implicit-function-declaration]
  125 |         avcodec_register_all();
      |         ^~~~~~~~~~~~~~~~~~~~
../git/demux.c:125:9: warning: nested extern declaration of 'avcodec_register_all' [-Wnested-externs]
../git/demux.c: In function 'get_esds_offset':
../git/demux.c:166:23: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
  166 |         for (i = 0; i < fileLen; i++) {
      |                       ^
../git/demux.c: In function 'demux_read':
../git/demux.c:202:39: error: implicit declaration of function 'av_bitstream_filter_filter' [-Werror=implicit-function-declaration]
  202 |                                 ret = av_bitstream_filter_filter(demux->bsf,
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:202:39: warning: nested extern declaration of 'av_bitstream_filter_filter' [-Wnested-externs]
../git/demux.c:235:25: error: implicit declaration of function 'av_free_packet'; did you mean 'av_get_packet'? [-Werror=implicit-function-declaration]
  235 |                         av_free_packet(&pk);
      |                         ^~~~~~~~~~~~~~
      |                         av_get_packet
../git/demux.c:235:25: warning: nested extern declaration of 'av_free_packet' [-Wnested-externs]
../git/demux.c: In function 'demux_deinit':
../git/demux.c:254:17: error: implicit declaration of function 'av_bitstream_filter_close' [-Werror=implicit-function-declaration]
  254 |                 av_bitstream_filter_close(demux->bsf);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:254:17: warning: nested extern declaration of 'av_bitstream_filter_close' [-Wnested-externs]
cc1: some warnings being treated as errors
make[1]: *** [Makefile:474: demux.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from ../git/main.c:46:
../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
   49 |         AVBitStreamFilterContext *bsf;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~



On Tue, Nov 30, 2021 at 11:13:01PM +0530, Sidraya Jayagond via lists.yoctoproject.org wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> The viddec-test-app provides the video decoder test app
> (tidec_decode) for j7-evm.
> 
> Signed-off-by: David Huang <d-huang@ti.com>
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  .../viddec-test-app_1.0.0.bb                   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> new file mode 100644
> index 00000000..48a17537
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=f17e17d664f72942124e4fcf06c178ee"
> +
> +DEPENDS = "libdrm ffmpeg"
> +
> +inherit autotools pkgconfig
> +
> +PR = "r1"
> +SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> -- 
> 2.17.1

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="viddec-test-app-log.txt"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function autotools_aclocals
DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64', 'comm=
on-linux', 'common-glibc', 'aarch64-linux', 'common']
DEBUG: Python function autotools_aclocals finished
DEBUG: Executing shell function do_compile
NOTE: make -j 72 CC=3Daarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed -fmacro-prefix-map=3D/OE/new-arago-master/build/tmp-default=
-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/vidd=
ec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/new-arag=
o-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.=
0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdebug=
-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-=
linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D                      -fdeb=
ug-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-o=
e-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/OE/=
new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-=
app/1.0.0-r1/recipe-sysroot
make  all-am
make[1]: Entering directory '/OE/new-arago-master/build/tmp-default-glibc/w=
ork/aarch64-oe-linux/viddec-test-app/1.0.0-r1/build'
aarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacr=
o-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe=
-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1  =
                    -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-def=
ault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/=
viddec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/new-=
arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/=
1.0.0-r1/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/ne=
w-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-ap=
p/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/OE/new-arago-master/build=
/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sy=
sroot -DHAVE_CONFIG_H -I. -I../git    -I/OE/new-arago-master/build/tmp-defa=
ult-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot/usr=
/include/libdrm  -Wall -Wextra -Wsign-compare -Werror-implicit-function-dec=
laration -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wnested-exter=
ns -Wpacked -Wswitch-enum -Wmissing-format-attribute -Wstrict-aliasing=3D2 =
-Winit-self -Wunsafe-loop-optimizations -Wdeclaration-after-statement -Wold=
-style-definition -Wno-missing-field-initializers -Wno-unused-parameter -Wn=
o-attributes -Wno-long-long -Winline -I../git/util -DDRMMODE -DDRM -O2 -pip=
e -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/new-arago-mast=
er/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=
=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdebug-pre=
fix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linu=
x/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1       =
               -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-default-=
glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D     =
                 -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-defaul=
t-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-nativ=
e=3D  -c -o main.o ../git/main.c
aarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacr=
o-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe=
-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1  =
                    -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-def=
ault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/=
viddec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/new-=
arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/=
1.0.0-r1/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/ne=
w-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-ap=
p/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/OE/new-arago-master/build=
/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sy=
sroot -DHAVE_CONFIG_H -I. -I../git    -I/OE/new-arago-master/build/tmp-defa=
ult-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot/usr=
/include/libdrm  -Wall -Wextra -Wsign-compare -Werror-implicit-function-dec=
laration -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wnested-exter=
ns -Wpacked -Wswitch-enum -Wmissing-format-attribute -Wstrict-aliasing=3D2 =
-Winit-self -Wunsafe-loop-optimizations -Wdeclaration-after-statement -Wold=
-style-definition -Wno-missing-field-initializers -Wno-unused-parameter -Wn=
o-attributes -Wno-long-long -Winline -I../git/util -DDRMMODE -DDRM -O2 -pip=
e -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/new-arago-mast=
er/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=
=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdebug-pre=
fix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linu=
x/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1       =
               -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-default-=
glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D     =
                 -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-defaul=
t-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-nativ=
e=3D  -c -o demux.o ../git/demux.c
In file included from ../git/demux.c:33:
../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
   49 |         AVBitStreamFilterContext *bsf;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c: In function 'find_stream':
../git/demux.c:64:36: error: 'AVStream' has no member named 'codec'
   64 |                 if (afc->streams[i]->codec->codec_type =3D=3D AVMED=
IA_TYPE_VIDEO && !st)
      |                                    ^~
../git/demux.c: In function 'open_stream':
../git/demux.c:78:32: error: 'AVStream' has no member named 'codec'
   78 |         AVCodecContext *cc =3D st->codec;
      |                                ^~
../git/demux.c:79:9: error: unknown type name 'AVBitStreamFilterContext'
   79 |         AVBitStreamFilterContext *bsf =3D NULL;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:94:23: error: implicit declaration of function 'av_bitstream=
_filter_init' [-Werror=3Dimplicit-function-declaration]
   94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannexb"=
);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:94:23: warning: nested extern declaration of 'av_bitstream_f=
ilter_init' [-Wnested-externs]
../git/demux.c:94:21: warning: assignment to 'int *' from 'int' makes point=
er from integer without a cast [-Wint-conversion]
   94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannexb"=
);
      |                     ^
../git/demux.c: In function 'demux_init':
../git/demux.c:124:9: error: implicit declaration of function 'av_register_=
all' [-Werror=3Dimplicit-function-declaration]
  124 |         av_register_all();
      |         ^~~~~~~~~~~~~~~
../git/demux.c:124:9: warning: nested extern declaration of 'av_register_al=
l' [-Wnested-externs]
../git/demux.c:125:9: error: implicit declaration of function 'avcodec_regi=
ster_all' [-Werror=3Dimplicit-function-declaration]
  125 |         avcodec_register_all();
      |         ^~~~~~~~~~~~~~~~~~~~
../git/demux.c:125:9: warning: nested extern declaration of 'avcodec_regist=
er_all' [-Wnested-externs]
../git/demux.c: In function 'get_esds_offset':
../git/demux.c:166:23: warning: comparison of integer expressions of differ=
ent signedness: 'int' and 'long unsigned int' [-Wsign-compare]
  166 |         for (i =3D 0; i < fileLen; i++) {
      |                       ^
../git/demux.c: In function 'demux_read':
../git/demux.c:202:39: error: implicit declaration of function 'av_bitstrea=
m_filter_filter' [-Werror=3Dimplicit-function-declaration]
  202 |                                 ret =3D av_bitstream_filter_filter(=
demux->bsf,
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:202:39: warning: nested extern declaration of 'av_bitstream_=
filter_filter' [-Wnested-externs]
../git/demux.c:235:25: error: implicit declaration of function 'av_free_pac=
ket'; did you mean 'av_get_packet'? [-Werror=3Dimplicit-function-declaratio=
n]
  235 |                         av_free_packet(&pk);
      |                         ^~~~~~~~~~~~~~
      |                         av_get_packet
../git/demux.c:235:25: warning: nested extern declaration of 'av_free_packe=
t' [-Wnested-externs]
../git/demux.c: In function 'demux_deinit':
../git/demux.c:254:17: error: implicit declaration of function 'av_bitstrea=
m_filter_close' [-Werror=3Dimplicit-function-declaration]
  254 |                 av_bitstream_filter_close(demux->bsf);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
../git/demux.c:254:17: warning: nested extern declaration of 'av_bitstream_=
filter_close' [-Wnested-externs]
cc1: some warnings being treated as errors
make[1]: *** [Makefile:474: demux.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from ../git/main.c:46:
../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
   49 |         AVBitStreamFilterContext *bsf;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../git/main.c: In function 'handle_outbuf':
../git/main.c:423:72: warning: suggest braces around empty body in an 'else=
' statement [-Wempty-body]
  423 |                 debug_printf("[fd%d] handle_outbuf QBUF success\n",=
 fd);
      |                                                                    =
    ^
../git/main.c: In function 'handle_capbuf':
../git/main.c:463:72: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  463 |                                         write(wrfd, buff[index].map=
ped + (i * s),
      |                                                                    =
    ^
../git/main.c:468:72: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  468 |                                         write(wrfd, buff[index].map=
ped + (h * s) +
      |                                                                    =
    ^
../git/main.c:468:82: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  468 |                                         write(wrfd, buff[index].map=
ped + (h * s) +
      |                                                                    =
              ^
../git/main.c:477:72: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  477 |                                         write(wrfd, buff[index].map=
ped + (i * s),
      |                                                                    =
    ^
../git/main.c:480:72: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  480 |                                         write(wrfd, buff[index].map=
ped + (h * s) + (i * s), str->width * str->num_bytes_per_pix);
      |                                                                    =
    ^
../git/main.c:480:82: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  480 |                                         write(wrfd, buff[index].map=
ped + (h * s) + (i * s), str->width * str->num_bytes_per_pix);
      |                                                                    =
              ^
../git/main.c:491:76: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  491 |                                         write(wrfd, buff[(index*3)]=
.mapped + (i * s),
      |                                                                    =
        ^
../git/main.c:497:78: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  497 |                                         write(wrfd, buff[(index*3)+=
1].mapped + (i * s),
      |                                                                    =
          ^
../git/main.c:502:78: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  502 |                                         write(wrfd, buff[(index*3)+=
2].mapped + (i * s),
      |                                                                    =
          ^
../git/main.c:508:76: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  508 |                                         write(wrfd, buff[(index*3)]=
.mapped + (i * s),
      |                                                                    =
        ^
../git/main.c:513:78: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  513 |                                         write(wrfd, buff[(index*3)+=
1].mapped + (i * s),
      |                                                                    =
          ^
../git/main.c:518:78: warning: pointer of type 'void *' used in arithmetic =
[-Wpointer-arith]
  518 |                                         write(wrfd, buff[(index*3)+=
2].mapped + (i * s),
      |                                                                    =
          ^
../git/main.c:569:72: warning: suggest braces around empty body in an 'else=
' statement [-Wempty-body]
  569 |                 debug_printf("[fd%d] handle_capbuf QBUF success\n",=
 fd);
      |                                                                    =
    ^
../git/main.c: In function 'create_drm_buffer':
../git/main.c:834:9: warning: ISO C90 forbids mixed declarations and code [=
-Wdeclaration-after-statement]
  834 |         struct drm_prime_handle prime;
      |         ^~~~~~
../git/main.c: In function 'stream_framelevel_parsing':
../git/main.c:898:63: warning: suggest braces around empty body in an 'if' =
statement [-Wempty-body]
  898 |                 debug_printf("\n%s: codec: H264",__FUNCTION__);
      |                                                               ^
../git/main.c:900:72: warning: suggest braces around empty body in an 'if' =
statement [-Wempty-body]
  900 |                 debug_printf("\n%s: codec format: HEVC\n",__FUNCTIO=
N__);
      |                                                                    =
    ^
../git/main.c:902:73: warning: suggest braces around empty body in an 'if' =
statement [-Wempty-body]
  902 |                 debug_printf("\n%s: codec format: MJPEG\n",__FUNCTI=
ON__);
      |                                                                    =
     ^
../git/main.c:906:9: warning: ISO C90 forbids mixed declarations and code [=
-Wdeclaration-after-statement]
  906 |         unsigned char *inp_buf =3D malloc(inp_buf_len);
      |         ^~~~~~~~
../git/main.c: In function 'init_device':
../git/main.c:1182:47: warning: comparison of integer expressions of differ=
ent signedness: 'int' and '__u32' {aka 'unsigned int'} [-Wsign-compare]
 1182 |                                 for (i =3D 0; i < buffer_cap.length=
; i++) {
      |                                               ^
../git/main.c: In function 'main':
../git/main.c:1555:23: warning: comparison of integer expressions of differ=
ent signedness: 'int' and 'unsigned int' [-Wsign-compare]
 1555 |         for (i =3D 0; i < num_devs; i++) {
      |                       ^
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NONE' not hand=
led in switch [-Wswitch-enum]
 1628 |         switch (str_context.pix_fmt) {
      |         ^~~~~~
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUYV422' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB24' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR24' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV410P' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV411P' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY8' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MONOWHITE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MONOBLACK' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_PAL8' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ444P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_UYVY422' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_UYYVYY411' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR8' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR4' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR4_BYTE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB8' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB4' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB4_BYTE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV12' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV21' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_ARGB' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_ABGR' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY16BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY16LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ440P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB48BE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB48LE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB565BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB565LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB555BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB555LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR565BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR565LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR555BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR555LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VAAPI' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P16LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P16BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P16LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P16BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P16LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P16BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_DXVA2_VLD' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB444LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB444BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR444LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR444BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA8' not handl=
ed in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y400A' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY8A' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR48BE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR48LE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P9BE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P9LE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P10BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P10BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P9BE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P9LE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P10BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P10LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P9BE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P9LE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBR24P' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP9BE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP9LE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP10BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP10LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP16BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP16LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P9BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P9LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P9BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P9LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P9BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P9LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P10BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P10LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P10BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P10LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P10BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P10LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P16BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P16LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P16BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P16LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P16BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P16LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VDPAU' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XYZ12LE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XYZ12BE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV16' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV20LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV20BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA64BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA64LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA64BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA64LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YVYU422' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA16BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA16LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP16BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP16LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_QSV' not handl=
ed in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MMAL' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_D3D11VA_VLD' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_CUDA' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_0RGB' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB0' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_0BGR' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR0' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P12BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P12LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P14BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P14LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P12BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P12LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P14BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P14LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P12BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P12LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P14BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P14LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP12BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP12LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP14BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP14LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ411P' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR8' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB8' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG8' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG8' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR16LE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR16BE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB16LE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB16BE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG16LE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG16BE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG16LE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG16BE=
' not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XVMC' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P10LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P10BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P12LE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P12BE' n=
ot handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_AYUV64LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_AYUV64BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VIDEOTOOLBOX' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P010LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P010BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP12BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP12LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP10BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP10LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MEDIACODEC' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY12BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY12LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY10BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY10LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P016LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P016BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_D3D11' not han=
dled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY9BE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY9LE' not h=
andled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRPF32BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRPF32LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAPF32BE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAPF32LE' no=
t handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_DRM_PRIME' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_OPENCL' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY14BE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY14LE' not =
handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAYF32BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAYF32LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P12BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P12LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P12BE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P12LE' =
not handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV24' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV42' not hand=
led in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VULKAN' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y210BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y210LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2RGB10LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2RGB10BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2BGR10LE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2BGR10BE' not=
 handled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P210BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P210LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P410BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P410LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P216BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P216LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P416BE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P416LE' not ha=
ndled in switch [-Wswitch-enum]
../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NB' not handle=
d in switch [-Wswitch-enum]
../git/main.c:1664:23: warning: comparison of integer expressions of differ=
ent signedness: 'int' and 'unsigned int' [-Wsign-compare]
 1664 |         for (i =3D 0; i < num_devs; i++) {
      |                       ^
At top level:
../git/main.c:55:40: warning: 'av_pix_fmt_descriptors' defined but not used=
 [-Wunused-const-variable=3D]
   55 | static const struct AVPixFmtDescriptor av_pix_fmt_descriptors[AV_PI=
X_FMT_NB] =3D {
      |                                        ^~~~~~~~~~~~~~~~~~~~~~
make[1]: *** [Makefile:474: main.o] Error 1
make[1]: Leaving directory '/OE/new-arago-master/build/tmp-default-glibc/wo=
rk/aarch64-oe-linux/viddec-test-app/1.0.0-r1/build'
make: *** [Makefile:348: all] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.

--lrZ03NoBR/3+SXJZ--
