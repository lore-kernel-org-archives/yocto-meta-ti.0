Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4E2AE00306
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2012 16:44:46 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYN00AOL0QG9DG1@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jan 2012 18:44:40 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0872E202E0; Mon,
	30 Jan 2012 19:44:39 -0500 (EST)
Date: Mon, 30 Jan 2012 19:44:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120131004439.GF2032@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: meta-ti layer split
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
X-List-Received-Date: Tue, 31 Jan 2012 00:44:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

After much debate and further considerations ;) we've decided to split meta-ti 
repository into 2 layers to ease up on inter-layer dependencies and to enable 
additional use cases of building basic BSP images with a very small set of 
layers, only requiring oe-core as a dependency. The proposed split is the 
following:

1. meta-ti-bsp-core - is the ultra portable layer.  Starting out it will 
contain only recipes-kernel and recipes-bootloader plus necessary machine 
configurations. Depending on the platform, can be as little as basic board 
support.

2. meta-ti-bsp-extras - provides the full chip functions with perhaps some 
extra constraints. Initialy this will contian support for DSP, Graphics, and 
Wifi. Provides additional board support for peripherals that may require 
software components like DSPBIOS, CodecEngine, gst-ti, firmware etc. Depends 
on meta-ti-bsp-core. In the future, if certain technologies prove themselves 
well portable, we may move them from meta-ti-bsp-extras to meta-ti-bsp-core.

I'll be starting the initial work on this in a separate branch, calling for 
wider review once ready.

Please provide feedback. Thanks.

-- 
Denys

