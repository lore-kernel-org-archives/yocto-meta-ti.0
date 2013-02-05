Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C17DE00736
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 21:21:15 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHQ00HCHEVEF9O2@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Feb 2013 23:21:15 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 04DEF20031; Tue,
	05 Feb 2013 00:21:13 -0500 (EST)
Date: Tue, 05 Feb 2013 00:21:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130205052113.GE27526@denix.org>
References: <alpine.DEB.2.02.1301281719080.9332@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1301281719080.9332@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: any need to keep specifying u-boot as preferred bootloader?
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
X-List-Received-Date: Tue, 05 Feb 2013 05:21:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 28, 2013 at 05:20:50PM -0500, Robert P. J. Day wrote:
> 
> $ grep -r "PREFERRED.*bootloader" *
> conf/machine/am37x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/am180x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/am3517-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/omap3evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/include/ti814x.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/include/davinci.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/include/omap4.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/include/ti816x.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> conf/machine/am335x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> $
> 
>   while it doesn't hurt, of course, any overwhelming need to repeat
> the same thing?

Well, there's no common machine file or include to set it once for all the 
machines in meta-ti. Plus, there is a possibility some machine can have a 
different provider for u-boot, as it's quite common for virtual/kernel...

-- 
Denys

