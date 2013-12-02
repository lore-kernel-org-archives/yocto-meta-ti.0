Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3233DE006D2
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2013 07:17:15 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB2FHA3U025200;
	Mon, 2 Dec 2013 09:17:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2FHAcU008378;
	Mon, 2 Dec 2013 09:17:10 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 2 Dec 2013 09:17:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB2FH9rU000730;
	Mon, 2 Dec 2013 09:17:09 -0600
Date: Mon, 2 Dec 2013 10:17:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tudor Florea <tudor.florea@enea.com>
Message-ID: <20131202151708.GG690@edge>
References: <1385994786-41789-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
In-Reply-To: <1385994786-41789-1-git-send-email-tudor.florea@enea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Do not use fixed MAC address in dts file
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
X-List-Received-Date: Mon, 02 Dec 2013 15:17:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 02, 2013 at 03:33:06PM +0100, Tudor Florea wrote:
> Do not use fixed MAC address in dts file to avoid duplicate MAC
> address in the same LAN segment

Should be updated to 3.10 anyway...

-- 
Denys


> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  .../avoid_duplicate_mac_addr.patch                 |   30 ++++++++++++++++++++
>  recipes-kernel/linux/linux-keystone_3.8.4.bb       |    1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch
> 
> diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch b/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch
> new file mode 100644
> index 0000000..d29b76c
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-keystone-3.8.4/avoid_duplicate_mac_addr.patch
> @@ -0,0 +1,30 @@
> +diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
> +index 50e7fe6..ae46287 100644
> +--- a/arch/arm/boot/dts/k2hk-evm.dts
> ++++ b/arch/arm/boot/dts/k2hk-evm.dts
> +@@ -2462,7 +2462,7 @@
> + 					rx-channel = "netrx1";
> + 					rx-queue-depth = <128 128 0 0>;
> + 					rx-buffer-size = <1500 4096 0 0>;
> +					efuse-mac = <0>;
> +-					local-mac-address = [02 18 31 7e 3e 6f];
> ++					/*local-mac-address = [02 18 31 7e 3e 6f]; */
> + 				};
> + 			};
> + 
> +@@ -2721,13 +2721,13 @@
> + 					rx-channel = "xgerx0";
> + 					rx-queue-depth = <128 0 0 0>;
> + 					rx-buffer-size = <1500 0 0 0>;
> +-					local-mac-address = [02 18 31 7e 3e 5e]; /*+++FIXME*/
> ++					/* local-mac-address = [02 18 31 7e 3e 5e]; */
> + 				};
> + 				interface-1 {
> + 					rx-channel = "xgerx1";
> + 					rx-queue-depth = <128 128 0 0>;
> + 					rx-buffer-size = <1500 4096 0 0>;
> +-					local-mac-address = [02 18 31 7e 3e 5f]; /*+++FIXME*/
> ++					/* local-mac-address = [02 18 31 7e 3e 5f]; */
> + 				};
> + 			};
> + 
> diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> index 709ef8f..17c3b1b 100644
> --- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> @@ -26,4 +26,5 @@ PR = "${MACHINE_KERNEL_PR}"
>  SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
>             file://defconfig\
>             file://libtraceevent-Remove-hard-coded-include-to-usr-local-include-in-Makefile.patch\
> +           file://avoid_duplicate_mac_addr.patch\
>            "
> -- 
> 1.7.10.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

