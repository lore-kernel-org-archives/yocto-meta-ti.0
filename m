Return-Path: <Daniel.Gorsulowski@esd.eu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15744E00BC4; Wed, 17 Oct 2018 05:52:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.59.41.9 listed in list.dnswl.org]
X-Greylist: delayed 567 seconds by postgrey-1.32 at yocto-www;
	Wed, 17 Oct 2018 05:52:45 PDT
Received: from mxpout02.htp-tel.de (mxpout02.htp-tel.de [212.59.41.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B87FDE00B9F
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 05:52:45 -0700 (PDT)
Received: from mxpin02.htp-tel.de (a212594129.net-htp.de [212.59.41.29])
	by mxpout02.htp-tel.de with ESMTPS id w9HChHnV003177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 14:43:17 +0200 (CEST)
Received: from esd-s3.esd.local (a81-14-233-218.net-htp.de [81.14.233.218])
	by mxpin02.htp-tel.de with ESMTPS id w9HChG5F020763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 14:43:16 +0200 (CEST)
Received: from [10.0.18.30] (10.0.18.30) by esd-s3.esd.local (10.0.0.66) with
	Microsoft SMTP Server (TLS) id 8.2.176.0;
	Wed, 17 Oct 2018 14:42:49 +0200
To: <meta-ti@yoctoproject.org>
From: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>
Message-ID: <bba4a971-2213-5b04-5fca-87e82d7d8591@esd.eu>
Date: Wed, 17 Oct 2018 14:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
	(mxpin02.htp-tel.de [172.19.12.5]);
	Wed, 17 Oct 2018 14:43:16 +0200 (CEST)
Subject: icss-emac-lld: how is /dev/uio_pruss_mem created?
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
X-List-Received-Date: Wed, 17 Oct 2018 12:52:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hello!

I have baked the recipes icss-emac-lld and icss-emac-lld-test. When I 
now start the resulting binary /usr/bin/icss_emacMainTest_am335x.out, I 
get a segmentation fault when opening /dev/uio_pruss_mem. This node does 
not exist.
How do I create this node, or for which recipe are there dependencies, 
so that this node is created automatically?

PS: My .dts has been patched with the 
recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi. Is there anything 
else to do?

Kind regards,
Daniel Gorsulowski

