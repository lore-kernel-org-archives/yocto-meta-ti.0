Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.7439.1645686185029575710
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 23:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=WXqJ5tLW;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.215.181, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pg1-f181.google.com with SMTP id 75so1008571pgb.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 23 Feb 2022 23:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=P3sui84r0ZEQdeh4hek1/qwB4jgvuMVU9fIpIsCDpKE=;
        b=WXqJ5tLWD6OlXzAxee1Ap8FpbZ+QqA+W7av708qiDdVZEyTxE0luLY0ROzhwAwB11n
         pViw8Y8chEPQfkTsDU78u83R2G4xhp+0omvKYZv2hvU4JAq8hWJQB3km2P3GGfLHsZN1
         dnvFw7kb/6S7PwKxzLtcMPPaasHxy/XAtwXmYBCYcw51vr/V38o3g0LL2rHspKBn3Q9Y
         cynsOp5UyaGVQRD+azaHFqarPM2qX89+YBrxTobouYFyLvyDBgP7tm56LaJfZYQTWnp8
         BLGnGNECClHjIQU17AUupqe/CSvQm7m3g8NdQTyOiwAUlpOKo2FBhtsTSTBO9DZ7qQIC
         qRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:in-reply-to:user-agent:content-disposition
         :content-transfer-encoding;
        bh=P3sui84r0ZEQdeh4hek1/qwB4jgvuMVU9fIpIsCDpKE=;
        b=lUqn+YfUPFvoVNOS3NxpLP0AxIUpRL0LIS2p6j/Rj9XpTS1q8iL9IysRxTyvKZl9FZ
         mHBedWQTmXCSR2TfARTsgHC4BjouTLYD9OfdtHV6hJKwd6QXjjBO2Z2p8MHYEAwPm9ut
         rQK+VLIJekK4+XNFM3TiKgzIdKSSMCALgFP4+E0ejx4BGZVast02kPrF7Rv1rXKS3K88
         LQ6SnER0oIBV5jbRqQTiU5sMQjmdoSVXKZlMD+elw5WhYN+3MoNNK58unTn81OU2XTiY
         QwPxW+QA8cSByfhLVfenGL1yccr1T6ppAepUKmbks84Fmbih7VTJv9ia9bE5ATkYGof6
         CHDg==
X-Gm-Message-State: AOAM531svi5FvC+iwmyx8ZnVz329q1dwACyU6LL7cy7ARBKiE47c/qKp
	thPccmlyZLZMkTtRp1FIur7isbq5A/iFa34sbxI31Nv1xPjE3RX3mK/Ql2xdbowSJhVXzKcZ0//
	V4NnpYcLeTdNYFy4SVWJ4
X-Google-Smtp-Source: ABdhPJzQlk5c9zQdZKOoByMCPvPFCUHaUq+I1Bq/m7HVK8f9RbmPdnDA0B5w/CYSdS+KtKcCVH38mA==
X-Received: by 2002:a63:7150:0:b0:372:e0e0:f1a4 with SMTP id b16-20020a637150000000b00372e0e0f1a4mr1238687pgn.507.1645686184128;
        Wed, 23 Feb 2022 23:03:04 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from sidraya-laptopU ([49.207.201.23])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090acb8b00b001bc54aea427sm4951749pju.22.2022.02.23.23.03.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Feb 2022 23:03:03 -0800 (PST)
Date: Thu, 24 Feb 2022 12:32:57 +0530
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, yogeshs@ti.com, praneeth@ti.com,
	d-huang@ti.com, prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	Angela Stegmaier <angelabaker@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [meta-ti] [dunfell/master][PATCH] viddec-test-app: Add the viddec-test-app recipe
Message-ID: <20220224070256.w52toig34zvi5inn@sidraya-laptopU>
References: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
 <20220222225727.GU26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220222225727.GU26229@denix.org>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset="ISO-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 05:57:34PM -0500, Denys Dmytriyenko wrote:
> Hi,
>=20
> viddec-test-app now breaks in master against the latest ffmpeg using gcc =
11.2.=20
> Can you please take a look?
>=20
> I'm seeing these errors (and full log is also attached):
>=20
>=20
> ../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
>    49 |         AVBitStreamFilterContext *bsf;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c: In function 'find_stream':
> ../git/demux.c:64:36: error: 'AVStream' has no member named 'codec'
>    64 |                 if (afc->streams[i]->codec->codec_type =3D=3D AVM=
EDIA_TYPE_VIDEO && !st)
>       |                                    ^~
> ../git/demux.c: In function 'open_stream':
> ../git/demux.c:78:32: error: 'AVStream' has no member named 'codec'
>    78 |         AVCodecContext *cc =3D st->codec;
>       |                                ^~
> ../git/demux.c:79:9: error: unknown type name 'AVBitStreamFilterContext'
>    79 |         AVBitStreamFilterContext *bsf =3D NULL;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:94:23: error: implicit declaration of function 'av_bitstre=
am_filter_init' [-Werror=3Dimplicit-function-declaration]
>    94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannex=
b");
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:94:23: warning: nested extern declaration of 'av_bitstream=
_filter_init' [-Wnested-externs]
> ../git/demux.c:94:21: warning: assignment to 'int *' from 'int' makes poi=
nter from integer without a cast [-Wint-conversion]
>    94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannex=
b");
>       |                     ^
> ../git/demux.c: In function 'demux_init':
> ../git/demux.c:124:9: error: implicit declaration of function 'av_registe=
r_all' [-Werror=3Dimplicit-function-declaration]
>   124 |         av_register_all();
>       |         ^~~~~~~~~~~~~~~
> ../git/demux.c:124:9: warning: nested extern declaration of 'av_register_=
all' [-Wnested-externs]
> ../git/demux.c:125:9: error: implicit declaration of function 'avcodec_re=
gister_all' [-Werror=3Dimplicit-function-declaration]
>   125 |         avcodec_register_all();
>       |         ^~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:125:9: warning: nested extern declaration of 'avcodec_regi=
ster_all' [-Wnested-externs]
> ../git/demux.c: In function 'get_esds_offset':
> ../git/demux.c:166:23: warning: comparison of integer expressions of diff=
erent signedness: 'int' and 'long unsigned int' [-Wsign-compare]
>   166 |         for (i =3D 0; i < fileLen; i++) {
>       |                       ^
> ../git/demux.c: In function 'demux_read':
> ../git/demux.c:202:39: error: implicit declaration of function 'av_bitstr=
eam_filter_filter' [-Werror=3Dimplicit-function-declaration]
>   202 |                                 ret =3D av_bitstream_filter_filte=
r(demux->bsf,
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:202:39: warning: nested extern declaration of 'av_bitstrea=
m_filter_filter' [-Wnested-externs]
> ../git/demux.c:235:25: error: implicit declaration of function 'av_free_p=
acket'; did you mean 'av_get_packet'? [-Werror=3Dimplicit-function-declarat=
ion]
>   235 |                         av_free_packet(&pk);
>       |                         ^~~~~~~~~~~~~~
>       |                         av_get_packet
> ../git/demux.c:235:25: warning: nested extern declaration of 'av_free_pac=
ket' [-Wnested-externs]
> ../git/demux.c: In function 'demux_deinit':
> ../git/demux.c:254:17: error: implicit declaration of function 'av_bitstr=
eam_filter_close' [-Werror=3Dimplicit-function-declaration]
>   254 |                 av_bitstream_filter_close(demux->bsf);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:254:17: warning: nested extern declaration of 'av_bitstrea=
m_filter_close' [-Wnested-externs]
> cc1: some warnings being treated as errors
> make[1]: *** [Makefile:474: demux.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> In file included from ../git/main.c:46:
> ../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
>    49 |         AVBitStreamFilterContext *bsf;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
>=20
>=20
> On Tue, Nov 30, 2021 at 11:13:01PM +0530, Sidraya Jayagond via lists.yoct=
oproject.org wrote:
> > From: Sidraya <sidraya.bj@pathpartnertech.com>
> >=20
> > The viddec-test-app provides the video decoder test app
> > (tidec_decode) for j7-evm.
> >=20
> > Signed-off-by: David Huang <d-huang@ti.com>
> > Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> > ---
> >  .../viddec-test-app_1.0.0.bb                   | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.=
0.0.bb
> >=20
> > diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb =
b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> > new file mode 100644
> > index 00000000..48a17537
> > --- /dev/null
> > +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Test applications for TI DEC (v4l2 decoder for IMG D5520)=
"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D1;endline=3D14;md5=3Df=
17e17d664f72942124e4fcf06c178ee"
> > +
> > +DEPENDS =3D "libdrm ffmpeg"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PR =3D "r1"
> > +SRCREV =3D "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
> > +
> > +EXTRA_OEMAKE =3D "CC=3D"${CC}""
> > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > +
> > +BRANCH =3D "master"
> > +SRC_URI =3D "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;=
protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +S =3D "${WORKDIR}/git"
> > --=20
> > 2.17.1

> DEBUG: Executing python function autotools_aclocals
> DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64', 'co=
mmon-linux', 'common-glibc', 'aarch64-linux', 'common']
> DEBUG: Python function autotools_aclocals finished
> DEBUG: Executing shell function do_compile
> NOTE: make -j 72 CC=3Daarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgn=
u -Wl,--as-needed -fmacro-prefix-map=3D/OE/new-arago-master/build/tmp-defau=
lt-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/vi=
ddec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/new-ar=
ago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.=
0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdeb=
ug-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-o=
e-linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D                      -fd=
ebug-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64=
-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/O=
E/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-tes=
t-app/1.0.0-r1/recipe-sysroot
> make  all-am
> make[1]: Entering directory '/OE/new-arago-master/build/tmp-default-glibc=
/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/build'
> aarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fma=
cro-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-=
oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1=
                      -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-d=
efault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debu=
g/viddec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/ne=
w-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-ap=
p/1.0.0-r1/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/=
new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-=
app/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/OE/new-arago-master/bui=
ld/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-=
sysroot -DHAVE_CONFIG_H -I. -I../git    -I/OE/new-arago-master/build/tmp-de=
fault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot/u=
sr/include/libdrm  -Wall -Wextra -Wsign-compare -Werror-implicit-function-d=
eclaration -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wnested-ext=
erns -Wpacked -Wswitch-enum -Wmissing-format-attribute -Wstrict-aliasing=3D=
2 -Winit-self -Wunsafe-loop-optimizations -Wdeclaration-after-statement -Wo=
ld-style-definition -Wno-missing-field-initializers -Wno-unused-parameter -=
Wno-attributes -Wno-long-long -Winline -I../git/util -DDRMMODE -DDRM -O2 -p=
ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/new-arago-ma=
ster/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=
=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdebug-pre=
fix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linu=
x/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1       =
               -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-default-=
glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D     =
                 -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-defaul=
t-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-nativ=
e=3D  -c -o main.o ../git/main.c
> aarch64-oe-linux-gcc  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fma=
cro-prefix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-=
oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1=
                      -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-d=
efault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=3D/usr/src/debu=
g/viddec-test-app/1.0.0-r1                      -fdebug-prefix-map=3D/OE/ne=
w-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-ap=
p/1.0.0-r1/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/=
new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-=
app/1.0.0-r1/recipe-sysroot-native=3D  --sysroot=3D/OE/new-arago-master/bui=
ld/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-=
sysroot -DHAVE_CONFIG_H -I. -I../git    -I/OE/new-arago-master/build/tmp-de=
fault-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot/u=
sr/include/libdrm  -Wall -Wextra -Wsign-compare -Werror-implicit-function-d=
eclaration -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wnested-ext=
erns -Wpacked -Wswitch-enum -Wmissing-format-attribute -Wstrict-aliasing=3D=
2 -Winit-self -Wunsafe-loop-optimizations -Wdeclaration-after-statement -Wo=
ld-style-definition -Wno-missing-field-initializers -Wno-unused-parameter -=
Wno-attributes -Wno-long-long -Winline -I../git/util -DDRMMODE -DDRM -O2 -p=
ipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/OE/new-arago-ma=
ster/build/tmp-default-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1=
=3D/usr/src/debug/viddec-test-app/1.0.0-r1                      -fdebug-pre=
fix-map=3D/OE/new-arago-master/build/tmp-default-glibc/work/aarch64-oe-linu=
x/viddec-test-app/1.0.0-r1=3D/usr/src/debug/viddec-test-app/1.0.0-r1       =
               -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-default-=
glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot=3D     =
                 -fdebug-prefix-map=3D/OE/new-arago-master/build/tmp-defaul=
t-glibc/work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/recipe-sysroot-nativ=
e=3D  -c -o demux.o ../git/demux.c
> In file included from ../git/demux.c:33:
> ../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
>    49 |         AVBitStreamFilterContext *bsf;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c: In function 'find_stream':
> ../git/demux.c:64:36: error: 'AVStream' has no member named 'codec'
>    64 |                 if (afc->streams[i]->codec->codec_type =3D=3D AVM=
EDIA_TYPE_VIDEO && !st)
>       |                                    ^~
> ../git/demux.c: In function 'open_stream':
> ../git/demux.c:78:32: error: 'AVStream' has no member named 'codec'
>    78 |         AVCodecContext *cc =3D st->codec;
>       |                                ^~
> ../git/demux.c:79:9: error: unknown type name 'AVBitStreamFilterContext'
>    79 |         AVBitStreamFilterContext *bsf =3D NULL;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:94:23: error: implicit declaration of function 'av_bitstre=
am_filter_init' [-Werror=3Dimplicit-function-declaration]
>    94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannex=
b");
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:94:23: warning: nested extern declaration of 'av_bitstream=
_filter_init' [-Wnested-externs]
> ../git/demux.c:94:21: warning: assignment to 'int *' from 'int' makes poi=
nter from integer without a cast [-Wint-conversion]
>    94 |                 bsf =3D av_bitstream_filter_init("h264_mp4toannex=
b");
>       |                     ^
> ../git/demux.c: In function 'demux_init':
> ../git/demux.c:124:9: error: implicit declaration of function 'av_registe=
r_all' [-Werror=3Dimplicit-function-declaration]
>   124 |         av_register_all();
>       |         ^~~~~~~~~~~~~~~
> ../git/demux.c:124:9: warning: nested extern declaration of 'av_register_=
all' [-Wnested-externs]
> ../git/demux.c:125:9: error: implicit declaration of function 'avcodec_re=
gister_all' [-Werror=3Dimplicit-function-declaration]
>   125 |         avcodec_register_all();
>       |         ^~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:125:9: warning: nested extern declaration of 'avcodec_regi=
ster_all' [-Wnested-externs]
> ../git/demux.c: In function 'get_esds_offset':
> ../git/demux.c:166:23: warning: comparison of integer expressions of diff=
erent signedness: 'int' and 'long unsigned int' [-Wsign-compare]
>   166 |         for (i =3D 0; i < fileLen; i++) {
>       |                       ^
> ../git/demux.c: In function 'demux_read':
> ../git/demux.c:202:39: error: implicit declaration of function 'av_bitstr=
eam_filter_filter' [-Werror=3Dimplicit-function-declaration]
>   202 |                                 ret =3D av_bitstream_filter_filte=
r(demux->bsf,
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:202:39: warning: nested extern declaration of 'av_bitstrea=
m_filter_filter' [-Wnested-externs]
> ../git/demux.c:235:25: error: implicit declaration of function 'av_free_p=
acket'; did you mean 'av_get_packet'? [-Werror=3Dimplicit-function-declarat=
ion]
>   235 |                         av_free_packet(&pk);
>       |                         ^~~~~~~~~~~~~~
>       |                         av_get_packet
> ../git/demux.c:235:25: warning: nested extern declaration of 'av_free_pac=
ket' [-Wnested-externs]
> ../git/demux.c: In function 'demux_deinit':
> ../git/demux.c:254:17: error: implicit declaration of function 'av_bitstr=
eam_filter_close' [-Werror=3Dimplicit-function-declaration]
>   254 |                 av_bitstream_filter_close(demux->bsf);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../git/demux.c:254:17: warning: nested extern declaration of 'av_bitstrea=
m_filter_close' [-Wnested-externs]
> cc1: some warnings being treated as errors
> make[1]: *** [Makefile:474: demux.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> In file included from ../git/main.c:46:
> ../git/demux.h:49:9: error: unknown type name 'AVBitStreamFilterContext'
>    49 |         AVBitStreamFilterContext *bsf;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ../git/main.c: In function 'handle_outbuf':
> ../git/main.c:423:72: warning: suggest braces around empty body in an 'el=
se' statement [-Wempty-body]
>   423 |                 debug_printf("[fd%d] handle_outbuf QBUF success\n=
", fd);
>       |                                                                  =
      ^
> ../git/main.c: In function 'handle_capbuf':
> ../git/main.c:463:72: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   463 |                                         write(wrfd, buff[index].m=
apped + (i * s),
>       |                                                                  =
      ^
> ../git/main.c:468:72: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   468 |                                         write(wrfd, buff[index].m=
apped + (h * s) +
>       |                                                                  =
      ^
> ../git/main.c:468:82: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   468 |                                         write(wrfd, buff[index].m=
apped + (h * s) +
>       |                                                                  =
                ^
> ../git/main.c:477:72: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   477 |                                         write(wrfd, buff[index].m=
apped + (i * s),
>       |                                                                  =
      ^
> ../git/main.c:480:72: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   480 |                                         write(wrfd, buff[index].m=
apped + (h * s) + (i * s), str->width * str->num_bytes_per_pix);
>       |                                                                  =
      ^
> ../git/main.c:480:82: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   480 |                                         write(wrfd, buff[index].m=
apped + (h * s) + (i * s), str->width * str->num_bytes_per_pix);
>       |                                                                  =
                ^
> ../git/main.c:491:76: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   491 |                                         write(wrfd, buff[(index*3=
)].mapped + (i * s),
>       |                                                                  =
          ^
> ../git/main.c:497:78: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   497 |                                         write(wrfd, buff[(index*3=
)+1].mapped + (i * s),
>       |                                                                  =
            ^
> ../git/main.c:502:78: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   502 |                                         write(wrfd, buff[(index*3=
)+2].mapped + (i * s),
>       |                                                                  =
            ^
> ../git/main.c:508:76: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   508 |                                         write(wrfd, buff[(index*3=
)].mapped + (i * s),
>       |                                                                  =
          ^
> ../git/main.c:513:78: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   513 |                                         write(wrfd, buff[(index*3=
)+1].mapped + (i * s),
>       |                                                                  =
            ^
> ../git/main.c:518:78: warning: pointer of type 'void *' used in arithmeti=
c [-Wpointer-arith]
>   518 |                                         write(wrfd, buff[(index*3=
)+2].mapped + (i * s),
>       |                                                                  =
            ^
> ../git/main.c:569:72: warning: suggest braces around empty body in an 'el=
se' statement [-Wempty-body]
>   569 |                 debug_printf("[fd%d] handle_capbuf QBUF success\n=
", fd);
>       |                                                                  =
      ^
> ../git/main.c: In function 'create_drm_buffer':
> ../git/main.c:834:9: warning: ISO C90 forbids mixed declarations and code=
 [-Wdeclaration-after-statement]
>   834 |         struct drm_prime_handle prime;
>       |         ^~~~~~
> ../git/main.c: In function 'stream_framelevel_parsing':
> ../git/main.c:898:63: warning: suggest braces around empty body in an 'if=
' statement [-Wempty-body]
>   898 |                 debug_printf("\n%s: codec: H264",__FUNCTION__);
>       |                                                               ^
> ../git/main.c:900:72: warning: suggest braces around empty body in an 'if=
' statement [-Wempty-body]
>   900 |                 debug_printf("\n%s: codec format: HEVC\n",__FUNCT=
ION__);
>       |                                                                  =
      ^
> ../git/main.c:902:73: warning: suggest braces around empty body in an 'if=
' statement [-Wempty-body]
>   902 |                 debug_printf("\n%s: codec format: MJPEG\n",__FUNC=
TION__);
>       |                                                                  =
       ^
> ../git/main.c:906:9: warning: ISO C90 forbids mixed declarations and code=
 [-Wdeclaration-after-statement]
>   906 |         unsigned char *inp_buf =3D malloc(inp_buf_len);
>       |         ^~~~~~~~
> ../git/main.c: In function 'init_device':
> ../git/main.c:1182:47: warning: comparison of integer expressions of diff=
erent signedness: 'int' and '__u32' {aka 'unsigned int'} [-Wsign-compare]
>  1182 |                                 for (i =3D 0; i < buffer_cap.leng=
th; i++) {
>       |                                               ^
> ../git/main.c: In function 'main':
> ../git/main.c:1555:23: warning: comparison of integer expressions of diff=
erent signedness: 'int' and 'unsigned int' [-Wsign-compare]
>  1555 |         for (i =3D 0; i < num_devs; i++) {
>       |                       ^
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NONE' not ha=
ndled in switch [-Wswitch-enum]
>  1628 |         switch (str_context.pix_fmt) {
>       |         ^~~~~~
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUYV422' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB24' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR24' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV410P' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV411P' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY8' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MONOWHITE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MONOBLACK' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_PAL8' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ444P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_UYVY422' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_UYYVYY411' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR8' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR4' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR4_BYTE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB8' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB4' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB4_BYTE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV12' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV21' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_ARGB' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_ABGR' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY16BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY16LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ440P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB48BE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB48LE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB565BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB565LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB555BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB555LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR565BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR565LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR555BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR555LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VAAPI' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P16LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P16BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P16LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P16BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P16LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P16BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_DXVA2_VLD' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB444LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB444BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR444LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR444BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA8' not han=
dled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y400A' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY8A' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR48BE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR48LE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P9BE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P9LE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P10BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P10BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P9BE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P9LE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P10BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P10LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P9BE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P9LE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBR24P' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP9BE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP9LE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP10BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP10LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP16BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP16LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P9BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P9LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P9BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P9LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P9BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P9LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P10BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P10LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P10BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P10LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P10BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P10LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P16BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA420P16LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P16BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P16LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P16BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P16LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VDPAU' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XYZ12LE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XYZ12BE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV16' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV20LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV20BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA64BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGBA64LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA64BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGRA64LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YVYU422' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA16BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YA16LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP16BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP16LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_QSV' not han=
dled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MMAL' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_D3D11VA_VLD'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_CUDA' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_0RGB' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_RGB0' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_0BGR' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BGR0' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P12BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P12LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P14BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV420P14LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P12BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P12LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P14BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV422P14LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P12BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P12LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P14BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV444P14LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP12BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP12LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP14BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRP14LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVJ411P' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR8'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB8'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG8'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG8'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR16=
LE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_BGGR16=
BE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB16=
LE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_RGGB16=
BE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG16=
LE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GBRG16=
BE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG16=
LE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_BAYER_GRBG16=
BE' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_XVMC' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P10LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P10BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P12LE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUV440P12BE'=
 not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_AYUV64LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_AYUV64BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VIDEOTOOLBOX=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P010LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P010BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP12BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP12LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP10BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAP10LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_MEDIACODEC' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY12BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY12LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY10BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY10LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P016LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P016BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_D3D11' not h=
andled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY9BE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY9LE' not=
 handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRPF32BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRPF32LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAPF32BE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GBRAPF32LE' =
not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_DRM_PRIME' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_OPENCL' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY14BE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAY14LE' no=
t handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAYF32BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_GRAYF32LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P12BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA422P12LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P12BE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_YUVA444P12LE=
' not handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV24' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NV42' not ha=
ndled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_VULKAN' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y210BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_Y210LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2RGB10LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2RGB10BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2BGR10LE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_X2BGR10BE' n=
ot handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P210BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P210LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P410BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P410LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P216BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P216LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P416BE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_P416LE' not =
handled in switch [-Wswitch-enum]
> ../git/main.c:1628:9: warning: enumeration value 'AV_PIX_FMT_NB' not hand=
led in switch [-Wswitch-enum]
> ../git/main.c:1664:23: warning: comparison of integer expressions of diff=
erent signedness: 'int' and 'unsigned int' [-Wsign-compare]
>  1664 |         for (i =3D 0; i < num_devs; i++) {
>       |                       ^
> At top level:
> ../git/main.c:55:40: warning: 'av_pix_fmt_descriptors' defined but not us=
ed [-Wunused-const-variable=3D]
>    55 | static const struct AVPixFmtDescriptor av_pix_fmt_descriptors[AV_=
PIX_FMT_NB] =3D {
>       |                                        ^~~~~~~~~~~~~~~~~~~~~~
> make[1]: *** [Makefile:474: main.o] Error 1
> make[1]: Leaving directory '/OE/new-arago-master/build/tmp-default-glibc/=
work/aarch64-oe-linux/viddec-test-app/1.0.0-r1/build'
> make: *** [Makefile:348: all] Error 2
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.

>=20
>=20
>=20

Sure, I will look into this.

--=20






This
message contains confidential information and is intended only=20
for the
individual(s) named. If you are not the intended
recipient, you are=20
notified that disclosing, copying, distributing or taking any
action in=20
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail=20
from your system. E-mail transmission
cannot be guaranteed to be secured or=20
error-free as information could be
intercepted, corrupted, lost, destroyed,=20
arrive late or incomplete, or contain
viruses. The sender therefore does=20
not accept liability for any errors or
omissions in the contents of this=20
message, which arise as a result of e-mail
transmission.
