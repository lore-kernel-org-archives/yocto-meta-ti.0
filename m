Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB9C4E013BA
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 20:23:57 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0E00M999JRM1P0@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 04 Mar 2012 22:23:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C5E5020168; Sun,
	04 Mar 2012 23:23:50 -0500 (EST)
Date: Sun, 04 Mar 2012 23:23:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20120305042350.GB14417@denix.org>
References: <alpine.DEB.2.02.1203041620080.12952@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1203041620080.12952@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: why does meta-ti layer define two pandaboard conf files?
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
X-List-Received-Date: Mon, 05 Mar 2012 04:23:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Mar 04, 2012 at 04:22:39PM -0500, Robert P. J. Day wrote:
> 
> * omap4430-panda.conf
> * pandaboard.conf
> 
>   what's stranger is that the first file up there includes omap3.inc
> (which seems weird), while the second includes omap4.inc.

The reason is that the historic OE name (1) hardcodes OMAP4430 in the machine 
name and is somewhat misleading for cases such as the new Pandaboard ES, which 
uses OMAP4460. Hence the commit:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=03f4a9211e59eb7e5dd406e683fa1aa320ac78df

Unfortunately, this wasn't finished and used to lack some defconfigs. And it 
definitely needs more testing and cleanup with the correct SOC_FAMILY name, 
although it's just a name...

-- 
Denys

