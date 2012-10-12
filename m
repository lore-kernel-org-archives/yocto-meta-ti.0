Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 427C9E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 15:47:20 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so4838319vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=akhQrgKDFwKGqSG1c+rKVhFdren0BUr64yGhwRp+bJU=;
	b=buh0NR7ty6otfpP9j1xtJae52/efurtr5FfTsLwtTmjmwKU7jeS5hbvbe14wqpwZ3D
	0nuOs0Pq4KqRJxQgpK9iGEJCGQQ4gmVB2ymRqnDOIJSwEaNjf2Lw4YdkPX1ngbHnhFBd
	GNRWuUnT18+to/Fypviu0nVXx+QINZnvdIUUNq9QrXSrxx6i/DAqQ8wq9GyERUavq5Nb
	U0U2D6LBE8RrtpbMAiqO2WzTtmhMP71OjQtMaJjAX68P8GA1DDHZbPIblYuJ/FjVSXSA
	8Xfyjs5CHDcXzGRr69kKEaq18efkeB6x4ua0cwtNctXO3xhZfC2WaNRCpO6LyCYD90n5
	gs1A==
MIME-Version: 1.0
Received: by 10.220.150.145 with SMTP id y17mr3287544vcv.11.1350082039573;
	Fri, 12 Oct 2012 15:47:19 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Fri, 12 Oct 2012 15:47:19 -0700 (PDT)
In-Reply-To: <20121012205355.GD32601@denix.org>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
	<20121012205355.GD32601@denix.org>
Date: Sat, 13 Oct 2012 00:47:19 +0200
X-Google-Sender-Auth: rgVj4FI5uREB9bgltt3jdgoQFQ0
Message-ID: <CA+2YH7vSox8RM4czqBjj0mngQ6ETeqS7jeejysddMamTVgKM8A@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Fri, 12 Oct 2012 22:47:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 12, 2012 at 10:53 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Oct 12, 2012 at 09:26:07PM +0200, Enrico Butera wrote:
>> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
>
> Enrico,
>
> Would you mind if I rather merge Herve's version from here:
>
> https://github.com/rvfh/meta-ti/commit/6342c03a0dba7d906db09630e57e2372998428df
>
> The recipe itself is quite trivial (I even had my own version in the works)
> and I only have couple minor fixes around SRCREV and its comment... But have
> you compared the defconfigs between those two patches? I know the first
> version of your patch used completely different unofficial defconfig... And
> you didn't specify which one you have in v2. I'd prefer to use the defconfig
> that was validated by the GLP team. Thanks.

Yes it's fine, as i said my defconfig was just copy/paste with a
couple of fixes and i see that those fixes are already there.

Enrico

