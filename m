Return-Path: <raj.khem@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD15DE01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 21:52:21 -0700 (PDT)
Received: by yenm12 with SMTP id m12so1190034yen.35
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 21:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:to:cc:subject:in-reply-to:x-mailer
	:mime-version:content-type;
	bh=QUEmw+od9clxEyO7ZpcA5tLRs5ovbWKcq2SkznFgmmQ=;
	b=DShCf+Cprqvkhw7AjmZqYUfHFMnLVnplI+rRubx7+5f6PLNe4h5ZQXeXYBqq3REHqC
	F+vypqkVl6NUidTq904C2Qrsv1RWn19580s0yip0W6jARaVvEAuDTfUuY7jQexYtx4JK
	vMmGwEmEbaWj5jyNY1mVfaraLV8jKkHkX7nLXMbc6gkjfggYc5iOZL+4TZtX8GJU3xJm
	0zo/jRSQ6xxeGEAf7mLfRfv82r5Jm6I2HUgnVB3HHJcNjDpFJy6K1Rk2GJcC1nbXvv8t
	T99sGmDxNNDS4kHVKm1aFlrc0KqyN8tdumqH4RrJ1TqFTPgEjzmINWokaD/tyL1LVFBc
	deXQ==
Received: by 10.101.179.40 with SMTP id g40mr518253anp.28.1347598327006;
	Thu, 13 Sep 2012 21:52:07 -0700 (PDT)
Received: from www.palm.com (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id s1sm664294yhi.5.2012.09.13.21.52.04
	(version=SSLv3 cipher=OTHER); Thu, 13 Sep 2012 21:52:05 -0700 (PDT)
Message-ID: <5052b7f5.8186ec0a.6161.1992@mx.google.com>
Date: Thu, 13 Sep 2012 21:52:07 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: "Denys Dmytriyenko" <denys@ti.com>
In-Reply-To: <20120914043004.GA26968@edge>
X-Mailer: Palm webOS
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Use 'packagegroup' instead of 'task'
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
X-List-Received-Date: Fri, 14 Sep 2012 04:52:22 -0000
Content-Type: multipart/alternative;
	boundary="Alternative_=_Boundary_=_1347598325"

--Alternative_=_Boundary_=_1347598325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><span style=3D"font-family:Prelude, Verdana, san-serif;"><br><br></=
span><span id=3D"signature"><div style=3D"font-family: arial, sans-serif; f=
ont-size: 12px;color: #999999">-- Sent from my HP TouchPad</div></span><spa=
n style=3D"color:navy; font-family:Prelude, Verdana, san-serif; "><hr align=
=3D"left" style=3D"width:75%">On Sep 13, 2012 9:30 PM, Denys Dmytriyenko &l=
t;denys@ti.com&gt; wrote: <br></span>On Tue, Sep 11, 2012 at 10:26:14AM -07=
00, Khem Raj wrote:=0A<br>&gt; On Tue, Sep 11, 2012 at 9:46 AM, Denys Dmytr=
iyenko &lt;denys@ti.com&gt; wrote:=0A<br>&gt; &gt; On Sun, Sep 09, 2012 at =
10:07:47AM -0700, Khem Raj wrote:=0A<br>&gt; &gt;&gt; bring recipes in sync=
 with OE-Core, task bbclass=0A<br>&gt; &gt;&gt; is now replaced by packageg=
roup.=0A<br>&gt; &gt;&gt;=0A<br>&gt; &gt;&gt; and task recipes are now call=
ed packagegroup_something=0A<br>&gt; &gt;&gt;=0A<br>&gt; &gt;&gt; diff --gi=
t a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kern=
el.inc=0A<br>&gt; &gt;&gt; index 04bc987..96d6121 100644=0A<br>&gt; &gt;&gt=
; --- a/recipes-kernel/linux/multi-kernel.inc=0A<br>&gt; &gt;&gt; +++ b/rec=
ipes-kernel/linux/multi-kernel.inc=0A<br>&gt; &gt;&gt; @@ -117,5 +117,5 @@ =
do_deploy_append () {=0A<br>&gt; &gt;&gt;=0A<br>&gt; &gt;&gt;  }=0A<br>&gt;=
 &gt;&gt;=0A<br>&gt; &gt;&gt; -do_compileconfigs[depends] +=3D "u-boot-mkim=
age-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysr=
oot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"=0A<b=
r>&gt; &gt;&gt; +do_compileconfigs[depends] +=3D "u-boot-mkimage-native:do_=
populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"=0A<br>&gt=
; &gt;=0A<br>&gt; &gt; Why is this changed? Isn't gcc${KERNEL_CCSUFFIX} no =
longer useful?=0A<br>&gt; &gt;=0A<br>&gt; =0A<br>&gt; this should have been=
 a separate commit.=0A<br>=0A<br>Then you wouldn't mind if I skip that hunk=
?=0A<br><br>Skip it for now yes<br>=0A<br>&gt; Its needed to accompany &gt;=
 http://patchwork.openembedded.org/patch/35151/=0A<br>=0A<br>Interesting. W=
hat's the status on that?=0A<br>=0A<br>I have posted a v2 and hopefully it =
will appear soon in oe-core<br>-- =0A<br>Denys=0A

--Alternative_=_Boundary_=_1347598325--
