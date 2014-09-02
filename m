Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E32FCE0078A; Mon,  1 Sep 2014 20:08:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.239 listed in list.dnswl.org]
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 671B9E0074B
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 20:08:12 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id m38B1o0021mTNtu0138BCW; Mon, 01 Sep 2014 20:08:12 -0700
Message-ID: <5405349A.4050207@pabigot.com>
Date: Mon, 01 Sep 2014 22:08:10 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
In-Reply-To: <5087658.bcI9hl3Jbj@localhost.localdomain>
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Tue, 02 Sep 2014 03:08:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2014 04:29 AM, Maciej Borzecki wrote:
> Hi all,
>
> There seems to be a problem booting BBB from SD card with uboot 2014.07 from
> meta-ti, 2013.07 from yocto seems to work.
> The card is partitioned as follows:
>
> Device         Boot     Start       End Blocks  Id System
> /dev/mmcblk0p1 *         2048     22527  10240   c W95 FAT32 (LBA)
> /dev/mmcblk0p2          22528    227327 102400  83 Linux
>
> I've already tried different cards.
>
> This is all I get on the serial console:
>
> U-Boot SPL 2014.07 (Aug 19 2014 - 10:45:01)
> MMC: block number 0x100 exceeds max(0x0)
> MMC: block number 0x200 exceeds max(0x0)
> *** Error - No Valid Environment Area found
> Using default environment
>
> MMC: block number 0x1 exceeds max(0x0)
> ** Can't read partition table on 0:0 **
> ** Partition 1 not valid on device 0 **
> spl_register_fat_device: fat register err - -1
> ### ERROR ### Please RESET the board ###

This is a bug in handling mmc_switch_part: what's happening is that the 
code reconfigures the mmc device to look at the partition on which the 
environment is to be found, but fails to restore it to reflect the state 
of the whole device.  I.e., the mmc capacity and lba are zero in my case 
(I have no partition 2 on the uSD card), but mmc_switch_part() returns 
-ENODEV on the attempt to switch back in fini_mmc_for_env() without also 
resetting the capacity to what the rest of the system expects.

I'll follow up here with a patch based on the ti-uboot repository. It 
conflicts with an upstream patch in u-boot master; I'll let Tom or 
somebody else sort that out.

Peter


