Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79EAAE01217
	for <meta-ti@yoctoproject.org>; Sun, 12 Feb 2012 19:17:47 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZB009ACAH9OA91@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 12 Feb 2012 21:17:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 949C6202F7; Sun,
	12 Feb 2012 22:17:33 -0500 (EST)
Date: Sun, 12 Feb 2012 22:17:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20120213031733.GA6838@denix.org>
References: <4F33F01E.2000601@communistcode.co.uk>
	<CAFZh4h-2sWHUGcBW-y--tw+QFaLeNAiFmnm43bh7NFNvqMwdzg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h-2sWHUGcBW-y--tw+QFaLeNAiFmnm43bh7NFNvqMwdzg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Beaglebone kernel/u-boot/userspace
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
X-List-Received-Date: Mon, 13 Feb 2012 03:17:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 09, 2012 at 11:30:18AM -0500, Brian Hutchinson wrote:
> I've not seen anything like you describe but I can say that I recently
> checked out master and didn't do anything different to it and was able
> to build a core-image-base for BeagleBoard just fine without having to
> mess with any other layers.
> 
> It is my understanding that you only have to mess with meta-ti if you
> are working with TI processors other than what is on the BeagleBoard.

That is not entirely correct statement. While you are correct that 
OE-Core/Yocto provide basic support for BeagleBoard, as a reference platform, 
it does not have all the peripherals and subsystems supported besides the 
baseport, such as SGX Graphics, DSP and some of the extension. For any of that 
you would need to add meta-ti layer and use it's BeagleBoard support.

-- 
Denys

