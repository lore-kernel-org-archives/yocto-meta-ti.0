Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f41.google.com (mail-pz0-f41.google.com
	[209.85.210.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E895AE01304
	for <meta-ti@yoctoproject.org>; Sat, 31 Mar 2012 08:57:46 -0700 (PDT)
Received: by dajx4 with SMTP id x4so791146daj.28
	for <meta-ti@yoctoproject.org>; Sat, 31 Mar 2012 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=85eBn3O7QZ6MsVXN+hBu+y1XJdgAVoCBK4x2TqRFuiw=;
	b=aZYP7/iJhreTURxuwuTFy0dHbewCMRJeuZNlVNgu5ku5KnOCKzOs2VIfH12qwF9PNA
	pB7a6KCpMWQDZ4A/VTAhjfTP6v+0SalR/+aHl4YZFS2zzAC1774FcxIKnInWYzvfmk0J
	uyoqiRsJrm7uju6Sa7kou1ZGlz2ArwM+u4FIX0SU3MzXeqetDITrBpAm6dey0+w/5JPg
	NoDji43uMOujqnAdjmJfm1v0MGISxRPGGXrBBlboxU6Yb41wuxKIaQJygXfAGXkIbexT
	yi/yProm5NkygTCAqGupb++n1ny5PV90X6wXuY6nmZqDyb2h9xel4I5yTqmTCBzAoV2B
	XFmA==
MIME-Version: 1.0
Received: by 10.68.131.74 with SMTP id ok10mr1235591pbb.95.1333209466658; Sat,
	31 Mar 2012 08:57:46 -0700 (PDT)
Sender: tom.rini@gmail.com
Received: by 10.143.68.15 with HTTP; Sat, 31 Mar 2012 08:57:46 -0700 (PDT)
In-Reply-To: <1333152979-6679-1-git-send-email-koen@dominion.thruhere.net>
References: <1333152979-6679-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 31 Mar 2012 08:57:46 -0700
X-Google-Sender-Auth: 04JdWJDktV0Lx3yfyOisa8Zsvsc
Message-ID: <CA+M6bXmZWgnm0gWNXymg3KGxM3_Fs9=LpOEvvDmtR43Gy6x0qQ@mail.gmail.com>
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: README: add sample git send-email commandline
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
X-List-Received-Date: Sat, 31 Mar 2012 15:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 5:16 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> This enables me to copy/paste the right commandline instead of picking th=
e wrong one from bash history.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0README | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/README b/README
> index 352cb2e..97439d7 100644
> --- a/README
> +++ b/README
> @@ -28,5 +28,7 @@ BINUVERSION =3D "2.20.1"
>
> =A0Send pull requests, patches, comments or questions to meta-ti@yoctopro=
ject.org
>
> +When sending single patches, please use something like 'git send-email -=
1 --to meta-ti@yoctoproject.org --subject-prefix=3Dmeta-ti'

ML adds the prefix.  Useful for the meta-oe README tho :)

--=20
Tom

