Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3FE68E00728
	for <meta-ti@yoctoproject.org>; Wed,  7 Dec 2011 17:13:11 -0800 (PST)
Received: (qmail invoked by alias); 08 Dec 2011 01:13:04 -0000
Received: from p4FDF0CDD.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.12.221]
	by mail.gmx.net (mp068) with SMTP; 08 Dec 2011 02:13:04 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18qbSRMf1kqWbNX0Z7jsztJ8PjXL5MCBWJxkU8Ry0
	LSqYS5+dKuqhF0
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Thu, 8 Dec 2011 02:13:11 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201112080213.11291.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Thu, 08 Dec 2011 01:13:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday, November 27, 2011 04:03:37 PM Koen Kooi wrote:
> Runtime tested on an xM rev C
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...-probe-DDC-bus-for-expansionboard-EEPROMS.patch |  165 ----------
>  ...p3-mem-Comment-enable_gpmc_cs_config-more.patch |   56 ++++
>  ...e-SDRC-dram_init-to-always-call-make_cs1_.patch |   66 ++++
>  ...-a-helper-function-to-set-timings-in-SDRC.patch |  172 +++++++++++
>  ...e-mem_ok-to-clear-again-after-reading-bac.patch |   30 ++
>  .../0005-OMAP3-Remove-get_mem_type-prototype.patch |   28 ++
>  .../0006-omap3-mem-Add-MCFG-helper-macro.patch     |   97 ++++++
>  ...d-optimal-SDRC-autorefresh-control-values.patch |   59 ++++
>  ...x-all-Micron-memory-timing-parts-with-the.patch |   55 ++++
>  ...ework-memory-initalization-and-devkit8000.patch |  174 +++++++++++
>  ...OMAP3-SPL-Add-identify_nand_chip-function.patch |  142 +++++++++
>  ...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch |  315
Is anybody working on SPL support for gumstix overo?

Andreas

