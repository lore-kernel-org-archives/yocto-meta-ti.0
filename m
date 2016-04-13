Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54579E00C29; Tue, 12 Apr 2016 17:06:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7C4AE00522
	for <meta-ti@yoctoproject.org>; Tue, 12 Apr 2016 17:06:01 -0700 (PDT)
Received: by mail-qg0-f44.google.com with SMTP id c6so30627773qga.1
	for <meta-ti@yoctoproject.org>; Tue, 12 Apr 2016 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=JsedCwvO2hPkHum2EFlFdj5qPKD1C+MWArl15MpXNB4=;
	b=cQIJMwcgQ3OBsckZmmd1Kl2zUoJCSRA+lJWwdl5ehsTd05yts0FBimiQa0lRzekc9r
	9oF/KhI+gI4LCXc6qTtIvkpoonAN2wi2vPKDOq/+Afc9CatMEHLMhHh6eG5ps9Ix9rrn
	mO/uGQUSX1iee16yMgdq3fr1dIuhPxr5HeXYYeba+lnpNqh9QMt53iQxTtWbFbskukI3
	gc7ctYjadVKeEVWkv74ZP7JcLEYBcEdW7BhSDmdcAbozcT5JI99tt0EueBEJYRkIhqHW
	01HHCWzzsgnt8y8wtasfMHrxGaIJ98AALBl1fAOZFgtL5jaaAk0ga5QNZDBsCIOoQsKJ
	2pCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=JsedCwvO2hPkHum2EFlFdj5qPKD1C+MWArl15MpXNB4=;
	b=CP0Se63gzIwXqwMMlZjGyQ4v1+qAeEBS/uiyIoZ0HCzeelZYqGuZjwvbebs7g/7bQw
	M12usZ/vYxQ/7fX/Z/T2CPXUbsai9TZ7jQ6uvqC0Iwy9pWhww7arTuD7l6GTNnmkZpVM
	4uiMfkKP2u7LxtEe/UwgqLiVlR2v0lTcPhCFyfHmhngr9+QDpcWZfmB87ENcbU3d1mMS
	GrNFiSXA1JGqoFbV97KJlqJCS42NHJIp5KpsxXev4gjNLf/NZESIPK3ny7tMg5LHbHOd
	zfQnZVXkgn61tjl0RWV7+n6gzKz2L9WYNnQv06821MGSFRu8LUWPTlnuRLF4XjPRt/YK
	LoRA==
X-Gm-Message-State: AOPr4FUpKXS/AVl4J0jLTEgwfEXVuaKyvBogTUpcheYcMy93RpLhva7eOvC+v+wcdMLS346fbYJRsSNeHZOVgQ==
MIME-Version: 1.0
X-Received: by 10.140.148.134 with SMTP id 128mr7778854qhu.98.1460505960431;
	Tue, 12 Apr 2016 17:06:00 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 17:05:59 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 17:05:59 -0700 (PDT)
In-Reply-To: <1460502529-16092-1-git-send-email-denis@denix.org>
References: <1460502529-16092-1-git-send-email-denis@denix.org>
Date: Tue, 12 Apr 2016 20:05:59 -0400
Message-ID: <CAMKF1sobLmTcEcg=raRFG60Cep-Mb+s+tW5cfrC_ppyN471wmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] iqn2-lld: fix -march gcc flag, as cortex-a15 belongs to armv7ve
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
X-List-Received-Date: Wed, 13 Apr 2016 00:06:03 -0000
Content-Type: multipart/alternative; boundary=001a1136ff18f6c7120530528a0b

--001a1136ff18f6c7120530528a0b
Content-Type: text/plain; charset=UTF-8

On Apr 12, 2016 7:09 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> https://gcc.gnu.org/ml/gcc-cvs/2014-01/msg00982.html
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/iqn2-lld/iqn2-lld_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/
iqn2-lld_git.bb
> index 4e68116..40a8ea7 100644
> --- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
> +++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
> @@ -8,6 +8,10 @@ PR = "${INC_PR}.0"
>
>  EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
>
> +do_configure () {
> +       sed -i -e 's/march=armv7-a/march=armv7ve/' build/armv7/
libiqn2_aearmv7.mk
> +}
> +

Is this recipe cortexa15 only recipe ?
>  do_compile () {
>         oe_runmake clean
>         oe_runmake lib
> --
> 2.2.0
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--001a1136ff18f6c7120530528a0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 12, 2016 7:09 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt;<br>
&gt; <a href=3D"https://gcc.gnu.org/ml/gcc-cvs/2014-01/msg00982.html">https=
://gcc.gnu.org/ml/gcc-cvs/2014-01/msg00982.html</a><br>
&gt;<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb">iqn2-lld=
_git.bb</a> | 4 ++++<br>
&gt; =C2=A01 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb">i=
qn2-lld_git.bb</a> b/recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb=
">iqn2-lld_git.bb</a><br>
&gt; index 4e68116..40a8ea7 100644<br>
&gt; --- a/recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb">iqn2-lld=
_git.bb</a><br>
&gt; +++ b/recipes-bsp/iqn2-lld/<a href=3D"http://iqn2-lld_git.bb">iqn2-lld=
_git.bb</a><br>
&gt; @@ -8,6 +8,10 @@ PR =3D &quot;${INC_PR}.0&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OEMAKE =3D &quot;-f makefile_armv7 PDK_INSTALL_PATH=3D${ST=
AGING_INCDIR}&quot;<br>
&gt;<br>
&gt; +do_configure () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s/march=3Darmv7-a/march=3Da=
rmv7ve/&#39; build/armv7/<a href=3D"http://libiqn2_aearmv7.mk">libiqn2_aear=
mv7.mk</a><br>
&gt; +}<br>
&gt; +</p>
<p dir=3D"ltr">Is this recipe cortexa15 only recipe ?<br>
&gt; =C2=A0do_compile () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake clean<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake lib<br>
&gt; --<br>
&gt; 2.2.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
</p>

--001a1136ff18f6c7120530528a0b--
