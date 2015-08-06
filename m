Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D99AEE00A73; Wed,  5 Aug 2015 19:47:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87AAFE00A53
	for <meta-ti@yoctoproject.org>; Wed,  5 Aug 2015 19:47:25 -0700 (PDT)
Received: by oio137 with SMTP id 137so29447063oio.0
	for <meta-ti@yoctoproject.org>; Wed, 05 Aug 2015 19:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=hxf2jF8vPVoBmt5O353gdohLRJkzhviUxztjQL6eEmo=;
	b=vnm3NMcYnXVDfpf6+3REGPxw0lraC8hqsTxYL8Jc52VogkTp1EyMg3nigpdWSgmH6Y
	cr15NxZmAk91+gZw3rH5igkGZ/nCQdhYkrOB8MuPBaTL0tNGKseYXwwtVhfapsBXoE4P
	u7dNT7/lT3++2a3DTp9mygq2bGv3hi1Yg510ZHIN4V0ajNog6C8UWXRG5NUxHZF2npou
	H+qdht1rUVo8aC/njazDqrWabqtAYeFghH3vORZMEVaJPymgJp1D00N/UIn5NGdqaL8d
	mR6z4mKnmrKNTikKxvgXpkjlVlbiK3xz/mLBdEX79rFO/+8TNP+zpS0m8GsxaFjhV0V3
	uRDg==
X-Received: by 10.202.206.84 with SMTP id e81mr10738935oig.132.1438829244426; 
	Wed, 05 Aug 2015 19:47:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.93.69 with HTTP; Wed, 5 Aug 2015 19:47:04 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 6 Aug 2015 14:47:04 +1200
Message-ID: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 02:47:28 -0000
Content-Type: multipart/alternative; boundary=001a113ad99c01b0f9051c9b8a29

--001a113ad99c01b0f9051c9b8a29
Content-Type: text/plain; charset=UTF-8

Hi,

I am using TI AM335x-EVM kit and while building image using
"arago-daisy-config.txt", I saw this warning :

omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now

and TUNE_FEATUREis "vfp"

Does that mean GPU is not getting used anymore ?
I am using QT5 with eglfs platform and need GPU support for performance.

Please clarify the situation.

Thanks
Ankur

--001a113ad99c01b0f9051c9b8a29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">I am using TI AM335x-EVM kit and while building image =
using &quot;arago-daisy-config.txt&quot;, I saw this warning :</div><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;co=
lor:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:#333399">omap3-sgx-modules-5.01.01.02 ONL=
Y supports hardfp mode for now<br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#333399">omap3-sgx-modu=
les-5.01.01.01 ONLY supports hardfp mode for now</div><div class=3D"gmail_d=
efault" style=3D"font-family:georgia,serif;font-size:small;color:#333399"><=
br></div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;fo=
nt-size:small;color:#333399">and TUNE_FEATUREis &quot;vfp&quot;</div><div c=
lass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;c=
olor:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:g=
eorgia,serif;font-size:small;color:#333399">Does that mean GPU is not getti=
ng used anymore ?</div><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:#333399">I am using QT5 with eglfs platfo=
rm and need GPU support for performance.</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">Please clarify the situation.</div><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif;font-size:small;color:#333399"=
><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;=
font-size:small;color:#333399">Thanks</div><div class=3D"gmail_default" sty=
le=3D"font-family:georgia,serif;font-size:small;color:#333399">Ankur</div>
</div>

--001a113ad99c01b0f9051c9b8a29--
