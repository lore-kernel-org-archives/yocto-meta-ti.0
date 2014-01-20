Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31519E00804
	for <meta-ti@yoctoproject.org>; Mon, 20 Jan 2014 06:55:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0KEtUn0032501;
	Mon, 20 Jan 2014 08:55:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KEtUtY003981;
	Mon, 20 Jan 2014 08:55:30 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 Jan 2014 08:55:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KEtTGr019536;
	Mon, 20 Jan 2014 08:55:29 -0600
Date: Mon, 20 Jan 2014 09:55:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
Message-ID: <20140120145529.GX12727@edge>
References: <52D936DC.2090806@gmail.com>
MIME-Version: 1.0
In-Reply-To: <52D936DC.2090806@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: usb problems with BeagleBone Black
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
X-List-Received-Date: Mon, 20 Jan 2014 14:55:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 17, 2014 at 03:57:48PM +0200, Samuli Piippo wrote:
> Hi,
> 
> I've been trying to get BeagleBone Black to work with poky image, but
> there seems to be some issues with USB.
> No usb devices are detected by kernel and e.g., 'lsusb' return error
> 'unable to initialize libusb: -99'
> 
> Anyone know if USB is supposed to work on BBB with current meta-ti layer?
> 
> I'm using yocto from dora branch and meta-ti from master.

Samuli,

There are reports that when meta-ti kernel is built with Poky, something is 
missing and USB doesn't get initialized. When built with Arago, everything 
works as expected. I haven't had a chance to look into it yet, but I'll try to 
figure out the difference once I have time. You might want to check the Arago 
build in the meantime.

-- 
Denys

