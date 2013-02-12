Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78B4BE006AD
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:38:43 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI400K7FSC84Z53@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Feb 2013 17:38:42 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3E3612008E; Tue,
	12 Feb 2013 18:38:31 -0500 (EST)
Date: Tue, 12 Feb 2013 18:38:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Message-id: <20130212233831.GD1858@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC: Denzil EOL
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
X-List-Received-Date: Tue, 12 Feb 2013 23:38:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

I'd like to propose the "End-of-Life" plans for "denzil" branch in meta-ti:

I just pushed the final set of patches to meta-ti/denzil - no new features or 
active development should be done in that branch. Only critical bug-fixes 
will be allowed, if required for supporting old products. Please use "danny" 
stable branch for your product development or even master branch for the 
latest unstable development, that corresponds to the tip of oe-core.

For those, not familiar with Yocto Project code names:

denzil = maintenance branch based on Yocto Project 1.2 made in Spring 2012
danny = maintenance branch based on Yocto Project 1.3 made in Fall 2012
master = latest development for future Yocto Project 1.4 target in Spring 2013

-- 
Denys

