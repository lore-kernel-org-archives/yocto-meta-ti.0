Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A68F4E0056A; Tue, 24 Jun 2014 14:05:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC54AE0027B
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 14:05:13 -0700 (PDT)
Received: by mail-qg0-f53.google.com with SMTP id i50so839229qgf.40
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=aIQUlYYP/6JuviRnsR8WPgHNJuC/gpG9ZW39EmCZwBQ=;
	b=XTgB2Eh5a57sFIUUZaDnBPFwf+AgopHhy37yX8jb7+bciDbvJk2/qyPErkUdCltxj4
	lbUc7iAxO1NUNDmlWom0/hRm+m6xQGF12hLh7vBUUpXoXValnU2iY+4zZSVWhKA7ft5m
	/Xq2kY3s97GJHHsn6e2s48HAhYu8FtGiUZKVDIDwZP4ujaUnXyFTFkvyfxGJJTzxCeN2
	RMJ98QjRIUnKfYakYc4xP1BOY2e/fpen4VxfVlAwSAwk/i4X1GSvTjI//SKPAg9eNml3
	8hdYBnaOf3B7ScrKZPFyrYHpdbfH1G61KgKxx18OlpNarmqOPJ4T/4SqJ82elnFZmms+
	lRHg==
X-Received: by 10.140.41.116 with SMTP id y107mr5475539qgy.78.1403643912709;
	Tue, 24 Jun 2014 14:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Tue, 24 Jun 2014 14:04:52 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 24 Jun 2014 18:04:52 -0300
Message-ID: <CAMCfZKH23Ow_q1MQPi3Hu3oGjTGqpJ=CyO5kXYXoK3uoE-55qA@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: omap3-sgx-modules fails on do_compile
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jun 2014 21:05:52 -0000
Content-Type: multipart/alternative; boundary=001a11c125e8ceed0004fc9b5056

--001a11c125e8ceed0004fc9b5056
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I'm using both yocto and meta-ti on daisy branch and removed meta-yocto-bsp
from bblayers.conf.

Doing a bitbake omap3-sgx-modules I'm receiving the following error:


DEBUG: Executing shell function do_compile
NOTE: make -j 8 -e MAKEFLAGS=
KERNEL_PATH=/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
KERNEL_SRC=/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
KERNEL_VERSION=3.14.8 CC=arm-qubit-linux-gnueabi-gcc  -mno-thumb-interwork
-marm LD=arm-qubit-linux-gnueabi-ld.bfd   AR=arm-qubit-linux-gnueabi-ar
 BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=
make -C /<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
M=`pwd`
make[1]: Entering directory
`/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
      CC [M]
 /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:
In function 'OMAPLFBWaitForVSync':
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:7:
error: implicit declaration of function 'register_vsync_cb'
[-Werror=implicit-function-declaration]
       if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
&completion, psDevInfo->uiFBDevID) != 0)
       ^
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:30:
error: 'vsync_callback_t' undeclared (first use in this function)
       if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
&completion, psDevInfo->uiFBDevID) != 0)
                              ^
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:30:
note: each undeclared identifier is reported only once for each function it
appears in
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:47:
error: expected ')' before 'grpx_irq_wait_handler'
       if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
&completion, psDevInfo->uiFBDevID) != 0)
                                               ^
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716:7:
error: implicit declaration of function 'unregister_vsync_cb'
[-Werror=implicit-function-declaration]
       if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait_handler ,
&completion, psDevInfo->uiFBDevID) != 0)
       ^
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716:49:
error: expected ')' before 'grpx_irq_wait_handler'
       if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait_handler ,
&completion, psDevInfo->uiFBDevID) != 0)
                                                 ^
cc1: some warnings being treated as errors
make[3]: ***
[/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o]
Error 1
make[2]: ***
[/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux]
Error 2
make[1]: ***
[_module_/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM]
Error 2
make[1]: Leaving directory
`/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
make: *** [all] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_compile (log file is located at
/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/temp/log.do_compile.3405)

I'm I missing something?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c125e8ceed0004fc9b5056
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div>I&#39;m using both yocto and met=
a-ti on daisy branch and removed meta-yocto-bsp from bblayers.conf.</div><d=
iv><br></div><div>Doing a bitbake=A0omap3-sgx-modules I&#39;m receiving the=
 following error:</div>

<div><br></div><div><br></div><div><div>DEBUG: Executing shell function do_=
compile</div><div>NOTE: make -j 8 -e MAKEFLAGS=3D KERNEL_PATH=3D/&lt;snip&g=
t;/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel KERNEL_SRC=3D/=
&lt;snip&gt;/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel KERN=
EL_VERSION=3D3.14.8 CC=3Darm-qubit-linux-gnueabi-gcc =A0-mno-thumb-interwor=
k -marm LD=3Darm-qubit-linux-gnueabi-ld.bfd =A0 AR=3Darm-qubit-linux-gnueab=
i-ar =A0BUILD=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D</div>

<div>make -C /&lt;snip&gt;/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/s=
rc/kernel M=3D`pwd`</div><div>make[1]: Entering directory `/&lt;snip&gt;/bu=
ild-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel&#39;</div><div>=A0 =
=A0 =A0 CC [M] =A0/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qubi=
t-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/G=
FX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o</div>

<div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnuea=
bi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/s=
ervices4/3rdparty/dc_ti335x_linux/omaplfb_linux.c: In function &#39;OMAPLFB=
WaitForVSync&#39;:</div>

<div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnuea=
bi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/s=
ervices4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:7: error: implicit de=
claration of function &#39;register_vsync_cb&#39; [-Werror=3Dimplicit-funct=
ion-declaration]</div>

<div>=A0 =A0 =A0 =A0if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_h=
andler, &amp;completion, psDevInfo-&gt;uiFBDevID) !=3D 0)</div><div>=A0 =A0=
 =A0 =A0^</div><div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qu=
bit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01=
/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:30: er=
ror: &#39;vsync_callback_t&#39; undeclared (first use in this function)</di=
v>

<div>=A0 =A0 =A0 =A0if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_h=
andler, &amp;completion, psDevInfo-&gt;uiFBDevID) !=3D 0)</div><div>=A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^</div><div>/&lt;snip&=
gt;/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-mo=
dules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdpar=
ty/dc_ti335x_linux/omaplfb_linux.c:710:30: note: each undeclared identifier=
 is reported only once for each function it appears in</div>

<div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnuea=
bi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/s=
ervices4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:47: error: expected &=
#39;)&#39; before &#39;grpx_irq_wait_handler&#39;</div>

<div>=A0 =A0 =A0 =A0if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_h=
andler, &amp;completion, psDevInfo-&gt;uiFBDevID) !=3D 0)</div><div>=A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0^</div><div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beagle=
bone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_0=
1_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716=
:7: error: implicit declaration of function &#39;unregister_vsync_cb&#39; [=
-Werror=3Dimplicit-function-declaration]</div>

<div>=A0 =A0 =A0 =A0if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait=
_handler , &amp;completion, psDevInfo-&gt;uiFBDevID) !=3D 0)</div><div>=A0 =
=A0 =A0 =A0^</div><div>/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone=
-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01=
_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716:49:=
 error: expected &#39;)&#39; before &#39;grpx_irq_wait_handler&#39;</div>

<div>=A0 =A0 =A0 =A0if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait=
_handler , &amp;completion, psDevInfo-&gt;uiFBDevID) !=3D 0)</div><div>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0^</div><div>cc1: some warnings being treated as errors<=
/div>

<div>make[3]: *** [/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beaglebone-qub=
it-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/=
GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o] Error 1</d=
iv>

</div><div><div>make[2]: *** [/&lt;snip&gt;/build-daisy/tmp-eglibc/work/bea=
glebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_=
5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux] Error 2</div>

<div>make[1]: *** [_module_/&lt;snip&gt;/build-daisy/tmp-eglibc/work/beagle=
bone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_0=
1_01_01/GFX_Linux_KM] Error 2</div><div>make[1]: Leaving directory `/&lt;sn=
ip&gt;/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel&#39;</div>

<div>make: *** [all] Error 2</div><div>ERROR: oe_runmake failed</div><div>W=
ARNING: exit code 1 from a shell command.</div><div>ERROR: Function failed:=
 do_compile (log file is located at /&lt;snip&gt;/build-daisy/tmp-eglibc/wo=
rk/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/temp/lo=
g.do_compile.3405)</div>

</div><div><br></div><div>I&#39;m I missing something?</div><div><br clear=
=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<=
br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www=
.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&a=
mp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarca=
dos.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c125e8ceed0004fc9b5056--
