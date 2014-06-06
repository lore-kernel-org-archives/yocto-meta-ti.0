Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B5EBE009E7; Fri,  6 Jun 2014 16:41:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
X-Greylist: delayed 3606 seconds by postgrey-1.32 at yocto-www;
	Fri, 06 Jun 2014 16:40:51 PDT
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6B8BE0073D
	for <meta-ti@yoctoproject.org>; Fri,  6 Jun 2014 16:40:51 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6R00L4XQYUE890@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 06 Jun 2014 17:40:22 -0500 (CDT)
Received: from [IPV6:2607:fb90:131e:727c:9eec:1b9:43e8:3cee]
	(unknown [172.56.3.205])	by gandalf.denix.org (Postfix)
	with ESMTPA id D68E02018E; Fri, 06 Jun 2014 18:40:05 -0400 (EDT)
User-Agent: K-9 Mail for Android
In-reply-to: <5392397D.4000504@emagii.com>
References: <5392397D.4000504@emagii.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 06 Jun 2014 18:38:13 -0400
To: Ulf Samuelsson <meta-ti@emagii.com>,meta-ti@yoctoproject.org
Message-id: <7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Fri, 06 Jun 2014 23:41:05 -0000
Content-transfer-encoding: 8bit
Content-type: text/plain; charset=UTF-8

On June 6, 2014 5:58:21 PM EDT, Ulf Samuelsson <meta-ti@emagii.com> wrote:
>
>Anyone succeded with this?
>
>Which version of Yocto (dora/daisy?)
>
>Which kernel
>
>Any extra patches needed?
>
>Any image recipe which can be shared?
>
>BR
>Ulf Samuelsson

I have the necessary recipes and images in meta-arago. And you'd obviously need meta-qt5. Do you need any specific features out of it?

-- 
Denys

