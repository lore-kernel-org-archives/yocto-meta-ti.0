Return-Path: <raffo@cdi.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49E16E009B6; Tue, 26 May 2015 13:19:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
X-Greylist: delayed 500 seconds by postgrey-1.32 at yocto-www;
	Tue, 26 May 2015 13:19:49 PDT
Received: from zimbra.cdi.com (dsl093-172-033.pit1.dsl.speakeasy.net
	[66.93.172.33])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 056D7E009AE
	for <meta-ti@yoctoproject.org>; Tue, 26 May 2015 13:19:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.cdi.com (Postfix) with ESMTP id CE3816458F1
	for <meta-ti@yoctoproject.org>; Tue, 26 May 2015 16:11:28 -0400 (EDT)
X-Virus-Scanned: amavisd-new at zimbra.cdi.com
Received: from zimbra.cdi.com ([127.0.0.1])
	by localhost (zimbra.cdi.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MECgDjDBdp0x for <meta-ti@yoctoproject.org>;
	Tue, 26 May 2015 16:11:28 -0400 (EDT)
Received: from zimbra.cdi.com (zimbra.cdi.com [10.150.232.226])
	by zimbra.cdi.com (Postfix) with ESMTP id 5B1E36458F3
	for <meta-ti@yoctoproject.org>; Tue, 26 May 2015 16:11:28 -0400 (EDT)
Date: Tue, 26 May 2015 16:11:28 -0400 (EDT)
From: "Rafael E. Herrera" <raffo@cdi.com>
To: meta-ti@yoctoproject.org
Message-ID: <1915412900.1068078.1432671088243.JavaMail.root@cdi.com>
In-Reply-To: <302450063.1067976.1432670067718.JavaMail.root@cdi.com>
MIME-Version: 1.0
X-Originating-IP: [10.150.232.1]
X-Mailer: Zimbra 7.2.7_GA_2942 (ZimbraWebClient - GC41 (Linux)/7.2.7_GA_2942)
Subject: Help getting started developing.
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
X-List-Received-Date: Tue, 26 May 2015 20:19:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello, 
I have purchased a TI UEVM5432 board. I have also successfully setup the development environment as described on the online documentation from the TI web site (http://processors.wiki.ti.com/index.php/OMAP5_GLSDK_Software_Developers_Guide). My developement environment is the recommended Ubuntu distribution.

I have also successfully build the Yocto filesystem (as per the instructions in the link above) and successfully booted the generated image in the evaluation board.

Where I need help is on how to port an application to the Yocto filesystem.  In particular, I need to build an X Window client.

The instructions in the link above don't explain well how to prepare/configure my environment so I can compile my application. 

If it were a typical development environment, I would configure my Makefiles and just compile. The method used with this development environment (bitbake) is not that clear to me.

Any help would be greatly appreciated.


Rafael Herrera 

