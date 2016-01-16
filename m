Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 953B7E00AF2; Fri, 15 Jan 2016 22:41:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
	*      [score: 0.0914]
X-Greylist: delayed 302 seconds by postgrey-1.32 at yocto-www;
	Fri, 15 Jan 2016 22:41:36 PST
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57A78E0090C
	for <meta-ti@yoctoproject.org>; Fri, 15 Jan 2016 22:41:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Sat, 16 Jan 2016 00:36:31 -0600
	id 00000000000613F9.000000005699E4EF.00002B6C
Date: Sat, 16 Jan 2016 00:36:31 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: meta-ti@yoctoproject.org
Message-ID: <20160116063631.GB10881@nl.grid.coop>
Mime-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: regression tests for am3517-evm machine?
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
X-List-Received-Date: Sat, 16 Jan 2016 06:41:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Are there any regression tests and/or recent builds of a 3.1x or 4.x series
kernel on an am3517 eval board? The original 'supported' TI SDKs were all
of the 2.6.x series, and it seems like somewhere along the way something
broke, and I'm trying to figure out what it was.

-- 
----------------------------------------------------------------------------
Troy Benjegerdes                 'da hozer'                  hozer@hozed.org
7 elements      earth::water::air::fire::mind::spirit::soul        grid.coop

      Never pick a fight with someone who buys ink by the barrel,
         nor try buy a hacker who makes money by the megahash


