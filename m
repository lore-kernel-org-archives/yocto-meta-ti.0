Return-Path: <chriskot@quietwind.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1738E0055C; Sat,  7 Jan 2017 23:57:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [69.89.30.42 listed in list.dnswl.org]
	* -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
	*      [score: 0.1606]
X-Greylist: delayed 401 seconds by postgrey-1.32 at yocto-www;
	Sat, 07 Jan 2017 23:57:04 PST
Received: from gproxy3-pub.mail.unifiedlayer.com
	(gproxy3-pub.mail.unifiedlayer.com [69.89.30.42])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 164FAE0052B
	for <meta-ti@yoctoproject.org>; Sat,  7 Jan 2017 23:57:03 -0800 (PST)
Received: (qmail 25434 invoked by uid 0); 8 Jan 2017 07:50:22 -0000
Received: from unknown (HELO CMOut01) (10.0.90.82)
	by gproxy3.mail.unifiedlayer.com with SMTP; 8 Jan 2017 07:50:22 -0000
Received: from host288.hostmonster.com ([74.220.215.88]) by CMOut01 with 
	id VjqH1u00A1v0fLi01jqLXt; Sun, 08 Jan 2017 00:50:20 -0700
X-Authority-Analysis: v=2.1 cv=V+Huj4Xi c=1 sm=1 tr=0
	a=ELBcn9xbBe8RKOfaP8USrg==:117 a=ELBcn9xbBe8RKOfaP8USrg==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=IkcTkHD0fZMA:10
	a=IgFoBzBjUZAA:10 a=M5E88hr7y--xY54s9jUA:9 a=QEXdDO2ut3YA:10
Received: from 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	([45.17.238.199]:60091 helo=[192.168.1.111])
	by host288.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.86_1)
	(envelope-from <chriskot@quietwind.net>) id 1cQ8F8-0008ET-EY
	for meta-ti@yoctoproject.org; Sun, 08 Jan 2017 00:50:18 -0700
To: meta-ti@yoctoproject.org
From: Chris Kottaridis <chriskot@quietwind.net>
Message-ID: <d1f3d61f-1edf-5b20-4c7c-4cbc22be45d2@quietwind.net>
Date: Sun, 8 Jan 2017 01:50:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host288.hostmonster.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - quietwind.net
X-BWhitelist: no
X-Source-IP: 45.17.238.199
X-Exim-ID: 1cQ8F8-0008ET-EY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	([192.168.1.111]) [45.17.238.199]:60091
X-Source-Auth: chriskot@quietwind.net
X-Email-Count: 1
X-Source-Cap: cXVpZXR3aW47cXVpZXR3aW47aG9zdDI4OC5ob3N0bW9uc3Rlci5jb20=
Subject: Beaglebone black wireless support
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
X-List-Received-Date: Sun, 08 Jan 2017 07:57:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Is the Beaglebone black wireless board supported in Yocto ?

Thanks
Chris Kottaridis

