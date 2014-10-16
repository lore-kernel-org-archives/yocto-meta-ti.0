Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65D84E00799; Thu, 16 Oct 2014 03:22:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E95EDE006EF
	for <meta-ti@yoctoproject.org>; Thu, 16 Oct 2014 03:22:09 -0700 (PDT)
Received: by mail-qc0-f172.google.com with SMTP id o8so2440429qcw.17
	for <meta-ti@yoctoproject.org>; Thu, 16 Oct 2014 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=xTncxggGxuk5LmC0Ty/D8mlHRvipo3HJVxaPftqjxTA=;
	b=hlzpUtszrD4uoxRLtV/lRF95YnzhWG/a8+tbH+vmlHH4pa0EAMKJVQD+B4Z/Qrsc74
	QYQS32Az0yfI0JGTz2DFjI0JBfqoj9lnV73ad/sX0TODnMuBrFQPvnz6kEI3+wuMcgEw
	8OBOVOXECaat4v/XcVJXq8oGeo6wL5TWnq+yJBOzSGmcHWdHXiWIb8i64pW4OqP/sYG3
	CdaFJ9hX3/84etwc/Sp5iKJgvzVkMIcLGUeMXFGX692Bb0PAXOwZMvj7UQZSGpeVryq7
	HWeQV0rYsSMRlVwV0RQu9UNNhA8d1ZT7JV8o1ojePg50GpLvENo/xDNvoYpJuS8FuHW/
	3cVA==
X-Received: by 10.140.40.227 with SMTP id x90mr392109qgx.69.1413454928651;
	Thu, 16 Oct 2014 03:22:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.20 with HTTP; Thu, 16 Oct 2014 03:21:48 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 16 Oct 2014 07:21:48 -0300
Message-ID: <CAMCfZKHsJuUaAvJj2z1NGb9dMKJZLdOPedDsjbxQEnAV8vGEaw@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: omap3-sgx-modules-5.01.01.01 compile fail
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
X-List-Received-Date: Thu, 16 Oct 2014 10:22:14 -0000
Content-Type: multipart/alternative; boundary=001a11c120a0edae310505879e81

--001a11c120a0edae310505879e81
Content-Type: text/plain; charset=ISO-8859-1

Folks,

After updating my local repo (daisy branch) omap3-sgx-modules fails on
compile task:

Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 -e MAKEFLAGS=
KERNEL_PATH=/<snip>/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
KERNEL_SRC=/<snip>/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
KERNEL_VERSION=3.14.19 CC=arm-qubit-linux-gnueabi-gcc  -mno-thumb-interwork
-marm LD=arm-qubit-linux-gnueabi-ld.bfd   AR=arm-qubit-linux-gnueabi-ar
 BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=
| make -C /<snip>/tmp-eglibc/sysroots/beaglebone/usr/src/kernel M=`pwd`
| make[1]: Entering directory
`/<snip>/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
|   CC [M]
 /<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.o
|
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.c:
In function 'PVRSRVDriverProbe':
|
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.c:411:2:
error: implicit declaration of function 'reset_control_clear_reset'
[-Werror=implicit-function-declaration]
|   ret = reset_control_clear_reset(rstc);
|   ^
|
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.c:471:17:
error: implicit declaration of function 'reset_control_is_reset'
[-Werror=implicit-function-declaration]
|                  ret = reset_control_is_reset(rstc);
|                  ^
|
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.c:399:32:
warning: unused variable 'pdata' [-Wunused-variable]
|   struct gfx_sgx_platform_data *pdata = dev->platform_data;
|                                 ^
| cc1: some warnings being treated as errors
| make[2]: ***
[/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.o]
Error 1
| make[1]: ***
[_module_/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM]
Error 2
| make[1]: Leaving directory
`/<snip>/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING:
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/temp/run.do_compile.29491:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/<snip>/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/temp/log.do_compile.29491)
ERROR: Task 2915 (/<snip>/poky/meta-ti/recipes-bsp/powervr-drivers/
omap3-sgx-modules_5.01.01.01.bb, do_compile) failed with exit code '1'




Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c120a0edae310505879e81
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Folks,</div><div><br></div><div>After updating my loc=
al repo (daisy branch) omap3-sgx-modules fails on compile task:</div><div><=
br></div><div><div>Log data follows:</div><div>| DEBUG: Executing shell fun=
ction do_compile</div><div>| NOTE: make -j 8 -e MAKEFLAGS=3D KERNEL_PATH=3D=
/&lt;snip&gt;/tmp-eglibc/sysroots/beaglebone/usr/src/kernel KERNEL_SRC=3D/&=
lt;snip&gt;/tmp-eglibc/sysroots/beaglebone/usr/src/kernel KERNEL_VERSION=3D=
3.14.19 CC=3Darm-qubit-linux-gnueabi-gcc =A0-mno-thumb-interwork -marm LD=
=3Darm-qubit-linux-gnueabi-ld.bfd =A0 AR=3Darm-qubit-linux-gnueabi-ar =A0BU=
ILD=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D</div><div>| make -C /&lt=
;snip&gt;/tmp-eglibc/sysroots/beaglebone/usr/src/kernel M=3D`pwd`</div><div=
>| make[1]: Entering directory `/&lt;snip&gt;/tmp-eglibc/sysroots/beaglebon=
e/usr/src/kernel&#39;</div><div>| =A0 CC [M] =A0/&lt;snip&gt;/tmp-eglibc/wo=
rk/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/Graphic=
s_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/module.o</div><div>=
| /&lt;snip&gt;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-mo=
dules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/=
env/linux/module.c: In function &#39;PVRSRVDriverProbe&#39;:</div><div>| /&=
lt;snip&gt;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-module=
s/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/=
linux/module.c:411:2: error: implicit declaration of function &#39;reset_co=
ntrol_clear_reset&#39; [-Werror=3Dimplicit-function-declaration]</div><div>=
| =A0 ret =3D reset_control_clear_reset(rstc);</div><div>| =A0 ^</div><div>=
| /&lt;snip&gt;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-mo=
dules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/=
env/linux/module.c:471:17: error: implicit declaration of function &#39;res=
et_control_is_reset&#39; [-Werror=3Dimplicit-function-declaration]</div><di=
v>| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D reset_control_is_reset(rstc)=
;</div><div>| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^</div><div>| /&lt;snip&gt=
;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.=
01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/env/linux/modu=
le.c:399:32: warning: unused variable &#39;pdata&#39; [-Wunused-variable]</=
div><div>| =A0 struct gfx_sgx_platform_data *pdata =3D dev-&gt;platform_dat=
a;</div><div>| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ^</div><div>| cc1: some warnings being treated as errors</div><div>| ma=
ke[2]: *** [/&lt;snip&gt;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/om=
ap3-sgx-modules/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/servic=
es4/srvkm/env/linux/module.o] Error 1</div><div>| make[1]: *** [_module_/&l=
t;snip&gt;/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules=
/5.01.01.01-r22c/Graphics_SDK_5_01_01_01/GFX_Linux_KM] Error 2</div><div>| =
make[1]: Leaving directory `/&lt;snip&gt;/tmp-eglibc/sysroots/beaglebone/us=
r/src/kernel&#39;</div><div>| make: *** [all] Error 2</div><div>| ERROR: oe=
_runmake failed</div><div>| WARNING: /&lt;snip&gt;/tmp-eglibc/work/beaglebo=
ne-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/temp/run.do_compil=
e.29491:1 exit 1 from</div><div>| =A0 exit 1</div><div>| ERROR: Function fa=
iled: do_compile (log file is located at /&lt;snip&gt;/tmp-eglibc/work/beag=
lebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22c/temp/log.do_co=
mpile.29491)</div><div>ERROR: Task 2915 (/&lt;snip&gt;/poky/meta-ti/recipes=
-bsp/powervr-drivers/<a href=3D"http://omap3-sgx-modules_5.01.01.01.bb">oma=
p3-sgx-modules_5.01.01.01.bb</a>, do_compile) failed with exit code &#39;1&=
#39;</div></div><div><br></div><div><br></div><div><br></div><br clear=3D"a=
ll"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Di=
ego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.emba=
rcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;ut=
m_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.c=
om.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div>

--001a11c120a0edae310505879e81--
