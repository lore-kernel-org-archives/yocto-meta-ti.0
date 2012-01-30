Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA399E00306
	for <meta-ti@yoctoproject.org>; Mon, 30 Jan 2012 10:20:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYM00KL4IXB0KZC@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jan 2012 12:19:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 16DC420238; Mon,
	30 Jan 2012 13:19:59 -0500 (EST)
Date: Mon, 30 Jan 2012 13:19:59 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20120130181959.GB2032@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: arago-devel@gforge.ti.com
Subject: meta-arago
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
X-List-Received-Date: Mon, 30 Jan 2012 18:20:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

We are starting the next phase of migrating the old Arago Project OE overlay 
into the new Yocto/OE-Core layer structure and there are some new resources to 
support the process.

The public git repo is hosted at http://arago-project.org/git/?p=meta-arago.git 
with the git URI being git://arago-project.org/git/meta-arago

The mailing list is meta-arago@arago-project.org with the Web interface for 
subscriptions at http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

There are 2 layers currently planned inside meta-arago repository:

1. Arago distribution - configs for TI SDK products, such as amends/bbappends, 
version preferences, tool selection (e.g. external toolchain) etc.

2. Extras - additional TI developed applications and tools, such as matrix, 
benchmarks, etc., that can be used in other distributions besides Arago.

Please feel free to provide feedback. Thanks.

-- 
Denys

