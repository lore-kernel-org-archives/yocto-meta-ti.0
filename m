Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A778E0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 11:39:54 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYF00A0P7YBK1C1@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Jan 2012 13:39:53 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 28757201F9; Thu,
	26 Jan 2012 14:39:46 -0500 (EST)
Date: Thu, 26 Jan 2012 14:39:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120126193946.GB18244@denix.org>
References: <1327604455-4778-1-git-send-email-Chase.Maupin@ti.com>
	<20120126190949.GA18244@denix.org>
	<7D46E86EC0A8354091174257B2FED1010BF9A18A@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1010BF9A18A@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] arm-benchmarks: port of am-benchmarks from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 19:39:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 26, 2012 at 07:28:01PM +0000, Maupin, Chase wrote:
> > > +do_install() {
> > > +	export ARCH=${TUNE_PKGARCH}
> > > +	make DESTDIR=${D} install
> > > +}
> > > +
> > > +RDEPENDS += matrix-gui-armbenchmarks-demos
> > 
> > Do we really need to RDEPENDS on matrix?
> 
> It just pulls in the matrix information, but this by itself does not pull in 
> full matrix.

Isn't it a bit reverse? Can arm-benchmarks be used on its own?

-- 
Denys

