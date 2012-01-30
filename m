Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9590CE00306
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2012 10:01:02 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYM00DIII1KR5C0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jan 2012 12:00:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7A8DE20238; Mon,
	30 Jan 2012 13:00:56 -0500 (EST)
Date: Mon, 30 Jan 2012 13:00:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120130180056.GA2032@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Git repo status and mirroring
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
X-List-Received-Date: Mon, 30 Jan 2012 18:01:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

We now have mirroring in place that automatically synchronizes meta-ti git 
repository to 3 external servers (alphabetically):

1. Angstrom, http://git.angstrom-distribution.org/
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/
git://git.angstrom-distribution.org/meta-texasinstruments

2. Arago, http://arago-project.org/git/
http://arago-project.org/git/?p=meta-ti.git
git://arago-project.org/git/meta-ti

3. Yocto, http://git.yoctoproject.org/
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
git://git.yoctoproject.org/meta-ti

Please use any of the above git URIs to access meta-ti repository, as they are 
all equal and synchronized on the fly from an internal master repository, 
which is not accessible outside of TI.

-- 
Denys

