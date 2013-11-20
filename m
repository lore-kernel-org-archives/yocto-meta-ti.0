Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70DFCE00543
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 00:26:03 -0800 (PST)
Received: by mail-vb0-f54.google.com with SMTP id p6so3206769vbe.41
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2013 00:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dgEegX3NOSnD+t2LOt74MMegkKLSwt09HJr/gd+JtPw=;
	b=RTs6FG9o+a2gUrXCu9AMnLXtWch2FGI8Ju2oyA6kWEn//gkLBl17H4IaWVoT6g7qgw
	IAE2g2ds5hLtNTQuZlV1+4PYxnZG07Yatjxz8oWDVy8VnoF9rb90O/jwN6KD+Jv0OjSF
	KTla+zylaiI90GMWjGm83WHLFrPu1mOq1J+pnUmWnBPF7XdX3oAxRcrstxwGJU+1hBeg
	Ms435IZRTmB3ZtltZrvhyerWgR0qPsTGUKI6m83mn1PZ8zt9Lay3jOfVNtXeT1aC0Vrm
	Hd2CYmIKIif+WFGXOfNXq4+b61tDbVKHq+Vz4j5/IHnFywTsCDABgfLt39zjQ//Rrbdk
	UlaQ==
MIME-Version: 1.0
X-Received: by 10.58.255.233 with SMTP id at9mr13086887ved.20.1384935963001;
	Wed, 20 Nov 2013 00:26:03 -0800 (PST)
Received: by 10.52.106.202 with HTTP; Wed, 20 Nov 2013 00:26:02 -0800 (PST)
In-Reply-To: <1384880351-6571-2-git-send-email-fcooper@ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
	<1384880351-6571-2-git-send-email-fcooper@ti.com>
Date: Wed, 20 Nov 2013 09:26:02 +0100
Message-ID: <CALbNGRTJ2N1gGdmuKKcC0VrtmG=TuMayC7YuTdR19TC6oCJQSA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/4] libgles-omap3: Add new 5.00.00.01 Graphics SDK alpha release
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
X-List-Received-Date: Wed, 20 Nov 2013 08:26:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 19, 2013 at 5:59 PM, Franklin S. Cooper Jr <fcooper@ti.com> wrote:
> * A new Graphics SDK that support 3.12 kernel for am335x
> * This Graphics SDK also adds initial support for AM43x
>
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../rc.pvr                                         |   28 +++++++++++++------
>  .../rc_dri.pvr                                     |   28 ++++++++++++-------
>  ...08.00.02.bb => libgles-omap3-x11_5.00.00.01.bb} |   29 +++++++++++++------
>  ...3_4.09.00.01.bb => libgles-omap3_5.00.00.01.bb} |   24 +++++++---------
>  4 files changed, 68 insertions(+), 41 deletions(-)
>  copy recipes-graphics/libgles/{libgles-omap3-x11-4.09.00.01 => libgles-omap3-5.00.00.01}/rc.pvr (87%)
>  mode change 100644 => 100755
>  copy recipes-graphics/libgles/{libgles-omap3-x11-4.09.00.01 => libgles-omap3-5.00.00.01}/rc_dri.pvr (88%)
>  mode change 100644 => 100755
>  copy recipes-graphics/libgles/{libgles-omap3_4.08.00.02.bb => libgles-omap3-x11_5.00.00.01.bb} (72%)
X drivers are not supported - right [1] ?

[1] http://processors.wiki.ti.com/index.php/RN_5_00_00_01_alpha#What_is_not_supported

Andreas

