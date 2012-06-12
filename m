Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 797FEE0044A
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 18:17:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M5H00MLCCWKBSU2@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Jun 2012 20:17:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ED8122016B; Mon,
	11 Jun 2012 21:17:06 -0400 (EDT)
Date: Mon, 11 Jun 2012 21:17:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120612011706.GD30300@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC: creating "extras" layer
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
X-List-Received-Date: Tue, 12 Jun 2012 01:17:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Koen, et al,

This is a RFC for creating an additional "extras" layer inside meta-ti to 
contain pieces and components that are either slightly outdated (i.e. old 
Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anything 
DSP-related, etc.) or require non-standard dependencies besides OE-Core 
(systemd?) with the possibility of moving them back to "main" meta-ti in the 
future, once they become "first-class citizens", i.e. gain current and 
continuing support.

The initial split (which is still "work in progress"), following the above 
description (except the systemd for now) can be checked at:

http://arago-project.org/git/?p=meta-ti.git;a=shortlog;h=refs/heads/split

I do understand this is, like any other restructuring, an invasive change, but 
is required to properly position "meta-ti" and the support behind it. I'm open 
to a discussion and any constructive criticism - feel free to comment. Thanks.

-- 
Denys

