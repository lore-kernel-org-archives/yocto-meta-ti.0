Return-Path: <ebutera@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7076EE004D2
	for <meta-ti@yoctoproject.org>; Tue, 21 Feb 2012 02:06:30 -0800 (PST)
Received: by yhjj52 with SMTP id j52so3598739yhj.35
	for <meta-ti@yoctoproject.org>; Tue, 21 Feb 2012 02:06:29 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.101.10.25 as permitted sender) client-ip=10.101.10.25; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.101.10.25 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.101.10.25])
	by 10.101.10.25 with SMTP id n25mr7327536ani.52.1329818789748 (num_hops
	= 1); Tue, 21 Feb 2012 02:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PAvkdtp6T8WVdR5zClt8NhYOX2cBFxVQL9wP43K+Vkc=;
	b=cnrJLKaDUAeaQ5FOJ9bmgIkrA/46/xbst1/6Vqgb2olKox8S4hKH6YHIXvhHhxBBHb
	p16z6SD3UoDFA2538pgNIjMg9lBCbvR5tpqxp189FhNLkDpKXLukWhRe2UfKiHhxBcka
	f7hHIXGA34APFaAgyhMrHmlncPhMXjJaDBo30=
MIME-Version: 1.0
Received: by 10.101.10.25 with SMTP id n25mr5648541ani.52.1329818789676; Tue,
	21 Feb 2012 02:06:29 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.236.125.167 with HTTP; Tue, 21 Feb 2012 02:06:29 -0800 (PST)
In-Reply-To: <20120221022619.49E6E52AB4@arago-project.org>
References: <20120221022619.49E6E52AB4@arago-project.org>
Date: Tue, 21 Feb 2012 11:06:29 +0100
X-Google-Sender-Auth: MZTkpM8mi_21CUadQEUr8gCvJQA
Message-ID: <CA+2YH7vTouOaa4r_gUqjMNk1uMcNvu3hz2x9ZkCcbWDND=n-Qg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Subject: Re: Peter A. Bigot : ti-dmai_svn: correct path within svn checkout
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
X-List-Received-Date: Tue, 21 Feb 2012 10:06:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 3:26 AM, Arago Project git
<git@arago-project.org> wrote:
> Module: meta-ti
> Branch: master
> Commit: a365e31ab237156244ff265a7c2d11153f2ef9b1
> URL: =A0 =A0http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3Da365e=
31ab237156244ff265a7c2d11153f2ef9b1
>
> Author: Peter A. Bigot <bigotp@acm.org>
> Date: =A0 Tue Jan 31 06:40:57 2012 -0600
>
> ti-dmai_svn: correct path within svn checkout
>
> At r642 as currently retrieved, the contents of ${S} are subdirectories d=
mai
> and patches, so the subsequent attempt to run "make clean" in ${S} fails
> because there is no Makefile there. =A0Append /dmai to the default ${S},
> remove the now incorrect /dmai from LIC_FILES_CHKSUM, and correct the
> strippath for the patches to reflect the new starting location.
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>
> Acked-by: Roger Monk <r-monk@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
> =A0recipes-ti/dmai/ti-dmai_svn.bb | =A0 =A09 ++++++---
> =A01 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn=
.bb
> index 3c5595d..3ac7a81 100644
> --- a/recipes-ti/dmai/ti-dmai_svn.bb
> +++ b/recipes-ti/dmai/ti-dmai_svn.bb
> @@ -1,11 +1,14 @@
> =A0require ti-dmai.inc
>
> +# Need to descend one level more to find source
> +S =3D "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface=
/dmai_${PV}/dmai"
> +

This is already set in ti-dmai.inc so it's not needed here.

Enrico

