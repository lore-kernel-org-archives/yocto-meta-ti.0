Return-Path: <ian.wisbon@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08BF3E00593
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 09:27:52 -0700 (PDT)
Received: from duckworth (192.168.3.31) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Thu, 28 Mar 2013 12:27:52 -0400
Date: Thu, 28 Mar 2013 12:27:53 -0400
From: "Ian M. Wisbon" <ian.wisbon@timesys.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130328122753.2b957cca@duckworth>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
Organization: Timesys Coporation
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: OMAP5: Booting build output
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
X-List-Received-Date: Thu, 28 Mar 2013 16:27:53 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Chase,

Thank you!

Does the SYSBOOT switch dictate whether the SD is used for booting? If
so, what is the correct setting? I've previously attempted to boot
using an SD card formatted as necessary for the OMAP4 Panda, but have
been unsuccessful - I assumed a similar FAT format would be required
for MLO/u-boot.img

Also - thank you for the boot script, as I just now saw the commit
changing the console from ttyO0 to ttyO2.

On Thu, 28 Mar 2013 12:06:21 -0400
"Maupin, Chase" <chase.maupin@ti.com> wrote:

> Ian,
> 
> We are updating the base images to boot this more easily.  Until then
> you can boot from an SD card that has a FAT boot partition and the
> rootfs in an EXT partition.
> 
> You need to pass one of the device tree files from the deploy
> directory as well.  If you use the attached boot.scr (It is called
> boot.txt so please rename it) file in your FAT partition you can just
> rename the omap5-panda.dtb file to omap5-evm.dtb in the FAT partition
> and the boot should work on a uEVM.  These names are changing in the
> next kernel to omap5-uevm.dtb by default.
> 
> Sincerely,
> Chase Maupin

Regards,


--
---
Ian Wisbon
Support Manager
Timesys Corporation

