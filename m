Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28EC0E0175F
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 07:47:20 -0700 (PDT)
Received: by mail-ea0-f177.google.com with SMTP id f15so700703eak.8
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2013 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zkAzPIL5mPD+Lq1gg/ppKumrPtmgrpajwbwluOomYRc=;
	b=z8ITFaswKHvO+rUy/78GAKIdSvJxFxerSO3fXyUn80uzsMNtLrGORmeSJw8QRi8OLb
	EwXJu+Ls0HDorzk+nDk4dfLzU7XD1+a6n537jm79T9Nf+EVjD76ET9lkaojG+Y4CQrbb
	8w+Jvbx3eSqiwyI5e8lT634UPkfHGEhEGxo4GNq/a4J5F/6MyE6UK4cLP18Yby2lAkLc
	Th661URwEmxPyOVZje4voFHqePowSw+YI9inPrdjsQT6tWAQDuBgfA4rJBnDWzW6SD80
	epxcgA+Y8gJOZCJUanPyb/LL+Pt1KZRGR0Ygmr/hq+wnugGQ4Aioj04MlLCxaKbq6L84
	luxA==
MIME-Version: 1.0
X-Received: by 10.14.108.200 with SMTP id q48mr694005eeg.105.1383144440046;
	Wed, 30 Oct 2013 07:47:20 -0700 (PDT)
Received: by 10.223.170.195 with HTTP; Wed, 30 Oct 2013 07:47:19 -0700 (PDT)
In-Reply-To: <20131030144235.77D56529D3@arago-project.org>
References: <20131030144235.77D56529D3@arago-project.org>
Date: Wed, 30 Oct 2013 10:47:19 -0400
Message-ID: <CAFZh4h_-_qNH9EWDqwXVxnws2_BOrD95v7ckErK4HtoyOQN3rA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Arago Project git <git@arago-project.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Denys Dmytriyenko : linux-ti-staging: update to 3. 12-rc7 and latest merges of feature trees
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
X-List-Received-Date: Wed, 30 Oct 2013 14:47:23 -0000
Content-Type: multipart/alternative; boundary=001a11c1b33c05a70f04e9f66985

--001a11c1b33c05a70f04e9f66985
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 30, 2013 at 10:42 AM, Arago Project git
<git@arago-project.org>wrote:

> Module: meta-ti
> Branch: dylan
> Commit: 7e054d1277cfe3b8d59725930cd42177cef1d9f0
> URL:
> http://arago-project.org/git/meta-ti.git?a=commit;h=7e054d1277cfe3b8d59725930cd42177cef1d9f0
>
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Tue Oct 29 17:11:53 2013 -0400
>
> linux-ti-staging: update to 3.12-rc7 and latest merges of feature trees
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>  recipes-kernel/linux/linux-ti-staging_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bbb/recipes-kernel/linux/
> linux-ti-staging_git.bb
> index ec86506..a1188e9 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
>
>  BRANCH = "ti-linux-3.12.y"
>
> -SRCREV = "eb765a394c625083399b956322451eb6872f16dc"
> -PV = "3.11+3.12-rc5"
> +SRCREV = "836c92478128790c75b832d21d1b3ab839fa3ca7"
> +PV = "3.11+3.12-rc7"
>
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild
>  MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

Excellent!  I'll give it a try.

B

--001a11c1b33c05a70f04e9f66985
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Oct 30, 2013 at 10:42 AM, Arago Project git <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:git@arago-project.org" target=3D"_blank">git@arago-project.org=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Module: meta-ti<br>
Branch: dylan<br>
Commit: 7e054d1277cfe3b8d59725930cd42177cef1d9f0<br>
URL: =A0 =A0<a href=3D"http://arago-project.org/git/meta-ti.git?a=3Dcommit;=
h=3D7e054d1277cfe3b8d59725930cd42177cef1d9f0" target=3D"_blank">http://arag=
o-project.org/git/meta-ti.git?a=3Dcommit;h=3D7e054d1277cfe3b8d59725930cd421=
77cef1d9f0</a><br>

<br>
Author: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com<=
/a>&gt;<br>
Date: =A0 Tue Oct 29 17:11:53 2013 -0400<br>
<br>
linux-ti-staging: update to 3.12-rc7 and latest merges of feature trees<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@=
ti.com</a>&gt;<br>
<br>
---<br>
<br>
=A0recipes-kernel/linux/<a href=3D"http://linux-ti-staging_git.bb" target=
=3D"_blank">linux-ti-staging_git.bb</a> | =A0 =A04 ++--<br>
=A01 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_git.bb=
" target=3D"_blank">linux-ti-staging_git.bb</a> b/recipes-kernel/linux/<a h=
ref=3D"http://linux-ti-staging_git.bb" target=3D"_blank">linux-ti-staging_g=
it.bb</a><br>

index ec86506..a1188e9 100644<br>
--- a/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_git.bb" targe=
t=3D"_blank">linux-ti-staging_git.bb</a><br>
+++ b/recipes-kernel/linux/<a href=3D"http://linux-ti-staging_git.bb" targe=
t=3D"_blank">linux-ti-staging_git.bb</a><br>
@@ -31,8 +31,8 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=A0BRANCH =3D &quot;ti-linux-3.12.y&quot;<br>
<br>
-SRCREV =3D &quot;eb765a394c625083399b956322451eb6872f16dc&quot;<br>
-PV =3D &quot;3.11+3.12-rc5&quot;<br>
+SRCREV =3D &quot;836c92478128790c75b832d21d1b3ab839fa3ca7&quot;<br>
+PV =3D &quot;3.11+3.12-rc7&quot;<br>
<br>
=A0# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild<br>
=A0MACHINE_KERNEL_PR_append =3D &quot;a+gitr${SRCPV}&quot;<br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</blockquote></div><br></div><div class=3D"gmail_extra">Excellent!=A0 I&#39=
;ll give it a try.<br><br></div><div class=3D"gmail_extra">B<br><br></div><=
/div>

--001a11c1b33c05a70f04e9f66985--
