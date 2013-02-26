Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7012E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:23:18 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIT00FAGDQEYMF5@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 00:23:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3D98420120; Tue,
	26 Feb 2013 01:23:02 -0500 (EST)
Date: Tue, 26 Feb 2013 01:23:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20130226062302.GF6725@denix.org>
References: <1361850513-12048-1-git-send-email-denis@denix.org>
	<CAMKF1spWxNHySgdtPGqnWNfJ7y4aH1ZZNkZkt4BjM1x20W6FyA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1spWxNHySgdtPGqnWNfJ7y4aH1ZZNkZkt4BjM1x20W6FyA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-omapl138: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 06:23:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 25, 2013 at 10:03:37PM -0800, Khem Raj wrote:
> On Mon, Feb 25, 2013 at 7:48 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > 0001-arm-fix-builds-with-gcc-4.7.patch
> 
> where is this patch in metadata ?

It's in files/ directory, see previous patch.

-- 
Denys

