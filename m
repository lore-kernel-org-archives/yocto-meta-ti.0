Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EEE8E0045D
	for <meta-ti@yoctoproject.org>; Sun,  6 Jan 2013 23:19:40 -0800 (PST)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Ts6zj-0005bw-2o from Muhammad_Shakeel@mentor.com 
	for meta-ti@yoctoproject.org; Sun, 06 Jan 2013 23:19:39 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 6 Jan 2013 23:19:38 -0800
Received: from [137.202.157.186] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Mon, 7 Jan 2013 07:19:36 +0000
Message-ID: <50EA770F.3030301@mentor.com>
Date: Mon, 7 Jan 2013 12:19:43 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 07 Jan 2013 07:19:38.0941 (UTC)
	FILETIME=[5AB976D0:01CDECA7]
X-Mailman-Approved-At: Mon, 21 Jan 2013 10:55:20 -0800
Subject: CONFIG_SAMPLES = y for pandaboard?
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
X-List-Received-Date: Mon, 07 Jan 2013 07:19:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I was curious about CONFIG_SAMPLES option in 
/meta-ti/recipes-kernel/linux/linux-omap4-3.4/pandaboard/defconfig. Only 
this particular defconfig in meta-ti layer seems to enable kernel 
samples. As per my knowledge these samples are built natively and will 
not be installed on target image.

Actually I am seeing the build error when trying to build pandaboard on 
CentOS5 and error is about some redefinitions. My initial findings 
suggest that, although there is some issue with older kernel headers, 
but these samples shouldn't be built at all.

Any help in this regard will be highly appreciated.

Best Regards,
Shakeel

