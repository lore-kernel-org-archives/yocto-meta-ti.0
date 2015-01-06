Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42AA4E008DC; Tue,  6 Jan 2015 10:19:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A47EE008CF
	for <meta-ti@yoctoproject.org>; Tue,  6 Jan 2015 10:19:32 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IJVLf031981
	for <meta-ti@yoctoproject.org>; Tue, 6 Jan 2015 12:19:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IJVeR017586
	for <meta-ti@yoctoproject.org>; Tue, 6 Jan 2015 12:19:31 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:19:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IJVJ0021625;
	Tue, 6 Jan 2015 12:19:31 -0600
Date: Tue, 6 Jan 2015 13:19:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181931.GA4759@edge>
References: <1420557386-20501-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420557386-20501-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy][PATCH] am57xx-evm, dra7xx-evm: ubifs: Increase "max_leb_cnt"
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
X-List-Received-Date: Tue, 06 Jan 2015 18:19:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Jan 06, 2015 at 10:16:26AM -0500, Jacob Stiffler wrote:
> * This is needed for larger filesystem size.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  conf/machine/am57xx-evm.conf |    2 +-
>  conf/machine/dra7xx-evm.conf |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
> index 25b1647..3010e04 100644
> --- a/conf/machine/am57xx-evm.conf
> +++ b/conf/machine/am57xx-evm.conf
> @@ -23,7 +23,7 @@ UBOOT_MACHINE = "beagle_x15_config"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
> +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4352"
>  
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
> index ba7b440..175450f 100644
> --- a/conf/machine/dra7xx-evm.conf
> +++ b/conf/machine/dra7xx-evm.conf
> @@ -23,7 +23,7 @@ UBOOT_MACHINE = "dra7xx_evm_config"
>  # UBI: logical eraseblock size:    126976 bytes
>  # from ubiattach stdout:
>  # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
> +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4352"
>  
>  # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>  # from dmesg:
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

