Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6D1EE0044C
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 14:58:20 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0F00J04P4XP770@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 05 Mar 2012 16:58:16 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 74C0320264; Mon,
	05 Mar 2012 17:58:09 -0500 (EST)
Date: Mon, 05 Mar 2012 17:58:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: jfabernathy <jfabernathy@gmail.com>
Message-id: <20120305225809.GE2030@denix.org>
References: <4F553F17.8000602@gmail.com>
MIME-version: 1.0
In-reply-to: <4F553F17.8000602@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building for OE pandaboard with angstrom
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
X-List-Received-Date: Mon, 05 Mar 2012 22:58:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 05, 2012 at 05:32:55PM -0500, jfabernathy wrote:
> Since the README says that to get the complete features of the
> pandaboard you need to follow the instructions at the angstrom link
> provided, I tried that.  The console-image builds and boots, but the
> systemd-gnome-image fails on a do_fetch.  Error message is below:
> 
> | ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'.
> Checksum mismatch!
> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
> has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when
> f99a90a91b23338b4df765c0d18eba73 was expected
> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
> has sha256 checksum
> 73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73
> when
> 6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was
> expected
> NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
> ERROR: Task 3064 (/home/jim/poky/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb,
> do_fetch) failed with exit code '1'

The main debian server no longer hosts 20111211 version of ca-certificates. 
The update to the current 20120212 version is currently pending in meta-oe:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/50963

Meanwhile you can locate the correct version of the tarball and place it in 
your downloads/ directory...

-- 
Denys

