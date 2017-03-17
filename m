Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10673E009CE; Fri, 17 Mar 2017 09:48:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.67 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CB1CE00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:48:12 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id u132so4180663wmg.1
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=eViJ/ld3YUcN3jCG2nTNitkcvWc1VoLAOAkM0ibpFXE=;
	b=QOe/w+8p0E3bqEsiRtW9827G0lDj3WBaXCbojrCDwjdsaRtG3kEysWkmVnRHGnfAPR
	FOe6TIExAEgtlGYlYuJf5CKaqYCUsjgZA+c8RsLP+MxZ8oYfe39Xip6paNuOKPSU0eal
	WxJIZ0Jvq+FpXt5AVu9Pdx373uxW1pmCtFSVjxVfuejuG/wTXpVDV2O5/z+0FtEZnI69
	ESLoksi+KJzBDkkvCGFfowoEQ9E3rClyS24D7RK6O4NQiMlEEfyxBgbpOxjRYIBjOiZj
	XG/uPdWcLN8cdJRLFvGDC8vziwTuq244xpn2zarBGabBgtDog4HRMgjL0kCUOyiXht80
	3QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=eViJ/ld3YUcN3jCG2nTNitkcvWc1VoLAOAkM0ibpFXE=;
	b=sinPKxcBlDeJCKnFQa11yjBkdrRWDIjrNWaAtwDHnxckMNyyMiU6YP5Sg2vdN74bT0
	IMmAY/LPsjsQg6V6B4VE9uqrY6GfTwCxqIgvSJ0gURIr8fNgPFY+p0uOJdGpIrlhqGwG
	Knt7bbjmxhEoXG8Qg16FnWrR89jc9lYucpr+Ttpp9g0Xggf06nDCQcd7dPd/ZpHNvrKn
	HzFiCtepYR0X9n63VlcPmCSxpfIrPgXvKeMxGo56X6bfBPFBgFbvLhdh/vSdhujzZNUC
	wba0N386UPPDu8AY07kRg/xyghhCPsX6SWSF130he87IYfJuk9vM6Z8cUi4wsvn6nao5
	skXw==
X-Gm-Message-State: AFeK/H2dyJaLl4+GNArHgGxSDs4J4YGYgvDAcqAGqfuTjP7roeGDrJeJW7tjnTBLlw6odGcmy7V7Ld3VsktpUQ==
X-Received: by 10.28.45.212 with SMTP id t203mr3507575wmt.37.1489769291586;
	Fri, 17 Mar 2017 09:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
In-Reply-To: <20170317163653.13127-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Mar 2017 16:47:59 +0000
Message-ID: <CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>, meta-ti@yoctoproject.org
Subject: Re: [morty-next][PATCH 1/2] kselftests: add libpcap-ng dependency
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
X-List-Received-Date: Fri, 17 Mar 2017 16:48:14 -0000
Content-Type: multipart/alternative; boundary=001a11422abc6c218b054aeff1f9

--001a11422abc6c218b054aeff1f9
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
wrote:

> libpcap-ng is required to build capabilities tests.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
> b/recipes-kernel/kselftests/kselftests_4.9.bb
> index a7b4ba67..dd94a65b 100644
> --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -DEPENDS = "libcap popt rsync-native"
> +DEPENDS = "libcap libcap-ng popt rsync-native"


Would ng replace old libcap

>
>
>  inherit kernel-arch
>
> @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>
> -ALLOW_EMPTY_${PN}-capabilities = "1"
> -
>  RDEPENDS_${PN}-cpu-hotplug += "bash"
>  RDEPENDS_${PN}-efivarfs += "bash"
>  RDEPENDS_${PN}-memory-hotplug += "bash"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001a11422abc6c218b054aeff1f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Fri, Mar 17, 2017 at 9:37 AM Fa=
thi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">fathi.boudra@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">libpcap-ng is=
 required to build capabilities tests.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org" =
class=3D"gmail_msg" target=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br cl=
ass=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0recipes-kernel/kselftests/<a href=3D"http://kselftests_4.9.bb" rel=3D=
"noreferrer" class=3D"gmail_msg" target=3D"_blank">kselftests_4.9.bb</a> | =
4 +---<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
diff --git a/recipes-kernel/kselftests/<a href=3D"http://kselftests_4.9.bb"=
 rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">kselftests_4.9.bb=
</a> b/recipes-kernel/kselftests/<a href=3D"http://kselftests_4.9.bb" rel=
=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">kselftests_4.9.bb</a>=
<br class=3D"gmail_msg">
index a7b4ba67..dd94a65b 100644<br class=3D"gmail_msg">
--- a/recipes-kernel/kselftests/<a href=3D"http://kselftests_4.9.bb" rel=3D=
"noreferrer" class=3D"gmail_msg" target=3D"_blank">kselftests_4.9.bb</a><br=
 class=3D"gmail_msg">
+++ b/recipes-kernel/kselftests/<a href=3D"http://kselftests_4.9.bb" rel=3D=
"noreferrer" class=3D"gmail_msg" target=3D"_blank">kselftests_4.9.bb</a><br=
 class=3D"gmail_msg">
@@ -11,7 +11,7 @@ S =3D &quot;${WORKDIR}/linux-${PV}&quot;<br class=3D"gmai=
l_msg">
<br class=3D"gmail_msg">
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
-DEPENDS =3D &quot;libcap popt rsync-native&quot;<br class=3D"gmail_msg">
+DEPENDS =3D &quot;libcap libcap-ng popt rsync-native&quot;</blockquote><di=
v><br></div><div>Would ng replace old libcap=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0inherit kernel-arch<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
@@ -139,8 +139,6 @@ FILES_${PN}-x86 =3D &quot;${bindir}/kselftests/x86&quot=
;<br class=3D"gmail_msg">
=C2=A0FILES_${PN}-zram =3D &quot;${bindir}/kselftests/zram&quot;<br class=
=3D"gmail_msg">
=C2=A0FILES_${PN}-dbg +=3D &quot;${bindir}/kselftests/*/.debug&quot;<br cla=
ss=3D"gmail_msg">
<br class=3D"gmail_msg">
-ALLOW_EMPTY_${PN}-capabilities =3D &quot;1&quot;<br class=3D"gmail_msg">
-<br class=3D"gmail_msg">
=C2=A0RDEPENDS_${PN}-cpu-hotplug +=3D &quot;bash&quot;<br class=3D"gmail_ms=
g">
=C2=A0RDEPENDS_${PN}-efivarfs +=3D &quot;bash&quot;<br class=3D"gmail_msg">
=C2=A0RDEPENDS_${PN}-memory-hotplug +=3D &quot;bash&quot;<br class=3D"gmail=
_msg">
--<br class=3D"gmail_msg">
2.11.0<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
meta-ti mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:meta-ti@yoctoproject.org" class=3D"gmail_msg" target=3D"_=
blank">meta-ti@yoctoproject.org</a><br class=3D"gmail_msg">
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er" class=3D"gmail_msg" target=3D"_blank">https://lists.yoctoproject.org/li=
stinfo/meta-ti</a><br class=3D"gmail_msg">
</blockquote></div></div>

--001a11422abc6c218b054aeff1f9--
