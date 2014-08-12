Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 940A2E00799; Tue, 12 Aug 2014 08:41:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D17CE006EF
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 08:41:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CFevSY000359;
	Tue, 12 Aug 2014 10:40:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFevZD011210;
	Tue, 12 Aug 2014 10:40:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 10:40:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFetX2019668;
	Tue, 12 Aug 2014 10:40:56 -0500
Date: Tue, 12 Aug 2014 11:40:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140812154053.GG23523@edge>
References: <1447960.SoSg2UIySt@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1447960.SoSg2UIySt@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black fails to boot with u-boot 2014.07, linux-yocto 3.14.5
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
X-List-Received-Date: Tue, 12 Aug 2014 15:41:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The bug report you are mentioning is not related to this issue, most probably. 
The manifestation is exactly the same - it just doesn't boot. But that can be 
caused by million other things... And yes, the fix was already pending 
upstream when I applied it to 2013.07 version in OE-Core. So 2014.07 already 
has it.

Now, as of the issue at hand - late last year, early this year, all platforms 
in U-boot have switched from uImage to zImage, as a default format. So, 
2013.07 used uImage and 2014.07 expects zImage.

Looks like you are mixing layers badly. So, you are getting machine config 
from Poky/meta-yocto, instead of meta-ti, because you are building kernel in 
uImage format and not zImage. But then you are building newer U-boot from 
meta-ti. But not the kernel from meta-ti...

Ways to fix it (from easy to hard):

1. Decide whether you want beaglebone from meta-yocto or from meta-ti and use 
the correct layer alone w/o mixing them.

2. If you are mixing layers, use all the components from the same layer - 
machine config, bootloader, kernel. If there are 2 layers defining the same 
machine (e.g. the case of beaglebone.conf provided by meta-yocto and meta-ti), 
the one that is mentioned first in the bblayers.conf wins. Machine config 
usually defines things like preferred bootloader, kernel versions, load 
addresses and image formats.

3. If for some of the reasons one of the components gets picked up from a 
wrong layer (u-boot from meta-ti instead of oe-core/meta-yocto), make sure to 
add additional PREFERRED_PROVIDER and/or PREFERRED_VERSION accordingly.

4. If you are adventurous and know what you are doing, you can mix and match 
layers as well as components, making sure all the parameters like image 
formats, addresses, etc. do match. My guess it should be possible to do so by 
setting KERNEL_IMAGETYPE to zImage, if you want to use latest U-boot from 
meta-ti, while keeping kernel from meta-yocto. Maybe some other tweaks...

Good luck and let me know if you have more questions.

-- 
Denys


On Tue, Aug 12, 2014 at 03:42:51PM +0200, Maciej Borzecki wrote:
> Hi all,
> 
> I'm having trouble booting BBB with current meta-ti 
> (f7b1140774e6c8c8aecde41388d40d9d407df6ff). The problem looks similar to this 
> bug report:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6165
> 
> Console output is as follows:
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 80007fc0 ...
>    Image Name:   Linux-3.14.5-yocto-standard
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    5098048 Bytes = 4.9 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 80f80000
>    Booting using the fdt blob at 0x80f80000
>    XIP Kernel Image ... OK
> OK
>    Using Device Tree in place at 80f80000, end 80f8a207
> 
> Starting kernel ...
> 
> 
> The original issue with kernel overlapping fdt was fixed with this patch to 
> OE-core: 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=2cae5f78ad2982c7ca0c22c085b71a1d2184a1b0 
> However, current meta-ti contains u-boot in version 2014.07, overriding 
> 2013.07 from poky master. I'm assuming that the patch eventually made it into 
> denx tree.
> 
> Another problem is that uImage contains the following info:
> Image Name:   Linux-3.14.5-yocto-standard
> Created:      Mon Aug 11 16:59:42 2014
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    5098048 Bytes = 4978.56 kB = 4.86 MB
> Load Address: 80008000
> Entry Point:  80008000
> 
> I'm not sure what is the order in which the addresses are applied. Is it 
> kernel -> default env -> uEnv.txt?
> 
> Adding uEnv.txt with these contents fixes the problem:
> loadaddr=0x82000000
> kernel_addr_r=0x82000000
> fdtaddr=0x88000000
> fdt_addr_r=0x88000000
> rdaddr=0x88080000
> ramdisk_addr_r=0x88080000
> bootm_size=0x10000000
> 
> Please advise how to fix it without falling back to uEnv.
> 
> -- 
> Maciej Borzęcki 
> Senior Software Engineer Open-RnD Sp. z o.o. 
> www.open-rnd.pl, Facebook, Twitter 
> mobile: +48 telefon, fax: +48 42 657 9079 
> 
> Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem lub 
> poufne informacje i została wysłana wyłącznie do wiadomości i użytku osób, do 
> których została zaadresowana. Jeśli wiadomość została otrzymana przypadkowo 
> zabrania się jej kopiowania lub rozsyłania do osób trzecich. W takim przypadku 
> uprasza się o natychmiastowe zniszczenie wiadomości oraz poinformowanie 
> nadawcy o zaistniałej sytuacji za pomocą wiadomości zwrotnej. Dziękujemy. 
> 
> This message, including any attachments hereto, may contain privileged or 
> confidential information and is sent solely for the attention and use of the 
> intended addressee(s). If you are not an intended addressee, you may neither 
> use this message nor copy or deliver it to anyone. In such case, you should 
> immediately destroy this message and kindly notify the sender by reply email. 
> Thank you. 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

