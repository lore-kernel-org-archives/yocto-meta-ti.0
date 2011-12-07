Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 21412E00728
	for <meta-ti@yoctoproject.org>; Wed,  7 Dec 2011 14:40:05 -0800 (PST)
Received: (qmail invoked by alias); 07 Dec 2011 22:40:04 -0000
Received: from p4FDF0CDD.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.12.221]
	by mail.gmx.net (mp067) with SMTP; 07 Dec 2011 23:40:04 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19PCOkZ825PvONLWJHM6FVnOrI2sEijSDrB0oPKAn
	wxSx8Tb8MnAY9x
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Wed, 7 Dec 2011 23:40:07 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
	<1323268934-11949-3-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1323268934-11949-3-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201112072340.08128.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 3/3] omap4430-panda: switch to u-boot-spl
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
X-List-Received-Date: Wed, 07 Dec 2011 22:40:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, December 07, 2011 03:42:14 PM Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  conf/machine/omap4430-panda.conf |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
> 
> diff --git a/conf/machine/omap4430-panda.conf
> b/conf/machine/omap4430-panda.conf index 8f9f86e..d6572ee 100644
> --- a/conf/machine/omap4430-panda.conf
> +++ b/conf/machine/omap4430-panda.conf
> @@ -4,10 +4,7 @@
> 
>  require conf/machine/include/omap3.inc
> 
> -EXTRA_IMAGEDEPENDS = "x-load u-boot-sakoman "
> -
> -XLOAD_MACHINE = "omap4430panda_config"
> -XLOAD_LOAD_ADDRESS = 0x40304350
> +EXTRA_IMAGEDEPENDS = "u-boot "
> 
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-sakoman"
Is u-boot-sakoman in PREFERRED_PROVIDER_virtual/bootloader wanted?
>  UBOOT_MACHINE = "omap4_panda_config"

