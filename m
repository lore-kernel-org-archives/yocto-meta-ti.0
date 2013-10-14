Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAB3EE016F4
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 17:21:15 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00EOAUAZKC90@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Oct 2013 19:20:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6A38520101; Sun,
	13 Oct 2013 20:20:57 -0400 (EDT)
Date: Sun, 13 Oct 2013 20:20:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20131014002057.GD27046@denix.org>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
	<CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Mon, 14 Oct 2013 00:21:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 09, 2013 at 03:15:17PM -0400, Brian Hutchinson wrote:
> The other problem I saw was in OECore, I added the linux-libc-headers for 
> 2.6.37.2 so packages would be built with headers that matched my TI PSP 
> based kernel and I was able to get that to work.

BTW, we do have it in meta-arago-extras, if you want to use it:

http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb;hb=HEAD

-- 
Denys

