Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2592E0145F
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2013 09:16:21 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJN00587RUNPR91@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 14 Mar 2013 11:16:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2A2AD201B1; Thu,
	14 Mar 2013 12:15:58 -0400 (EDT)
Date: Thu, 14 Mar 2013 12:15:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org, meta-arago@arago-project.org
Message-id: <20130314161558.GA14761@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: svn: Unknown hostname 'gcc.gnu.org'
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
X-List-Received-Date: Thu, 14 Mar 2013 16:16:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

If you see a breakage this morning with a "danny" based configuration 
containing meta-linaro layer, that looks like this:

ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Fetch command failed with exit code 1, output:
svn: Unknown hostname 'gcc.gnu.org'

then it is caused by the latest change in meta-linaro as it relates to the 
toolchain and other pieces being moved around. Unfortunately, meta-linaro 
didn't have a "danny" dedicated branch and major changes like that break 
stable configs. I've talked to Marcin and he's creating a "danny" branch right 
now. I'm updating oe-layersetup configs for that change, if you use it. 
Otherwise, update your bblayers.conf accordingly.

-- 
Denys

