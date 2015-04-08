Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51382E008EC; Wed,  8 Apr 2015 08:31:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 383 seconds by postgrey-1.32 at yocto-www;
	Wed, 08 Apr 2015 08:31:34 PDT
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FECFE003A8
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2015 08:31:34 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7F68BF811E2; Wed,  8 Apr 2015 09:25:10 -0600 (MDT)
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 1EF16F811E2;
	Wed,  8 Apr 2015 09:25:10 -0600 (MDT)
Message-ID: <55254865.1010209@mlbassoc.com>
Date: Wed, 08 Apr 2015 09:25:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: No USB on BeagleBone White
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
X-List-Received-Date: Wed, 08 Apr 2015 15:31:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I need to resurrect my old BeagleBone White and I'm trying to
do it using Poky/Yocto + meta-ti.  I've managed to build and
boot my board, but it detects nothing when something is plugged
into the USB [not OTG/serial-port] port.

Any ideas what I need to do to get this going?  The board is
pretty useless to me without the extra USB.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

