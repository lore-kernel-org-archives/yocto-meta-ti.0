Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EC2EE00985; Sat,  7 Jun 2014 00:56:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [213.150.131.4 listed in list.dnswl.org]
X-Greylist: delayed 1828 seconds by postgrey-1.32 at yocto-www;
	Sat, 07 Jun 2014 00:55:58 PDT
Received: from smtprelay-h31.telenor.se (smtprelay-h31.telenor.se
	[213.150.131.4])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BF99E0073A
	for <meta-ti@yoctoproject.org>; Sat,  7 Jun 2014 00:55:58 -0700 (PDT)
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 0E662C1AD
	for <meta-ti@yoctoproject.org>; Sat,  7 Jun 2014 09:25:06 +0200 (CEST)
X-SENDER-IP: [83.227.57.112]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuEnAKe9klNT4zlwPGdsb2JhbAANTIckqAsGmRABgRgEAQEBATiEOAEBAQEDIxVAEQsOCgICBRYLAgIJAwIBAgExFAYBDAYCAQGIQ60Yd58aF4EqhDOJE4J1gUwBA5odlwI
X-IPAS-Result: AuEnAKe9klNT4zlwPGdsb2JhbAANTIckqAsGmRABgRgEAQEBATiEOAEBAQEDIxVAEQsOCgICBRYLAgIJAwIBAgExFAYBDAYCAQGIQ60Yd58aF4EqhDOJE4J1gUwBA5odlwI
X-IronPort-AV: E=Sophos;i="4.98,993,1392159600"; d="scan'208";a="24769457"
Received: from c-7039e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.112])
	by ipb2.telenor.se with ESMTP; 07 Jun 2014 09:24:17 +0200
Message-ID: <5392BE20.2000509@emagii.com>
Date: Sat, 07 Jun 2014 09:24:16 +0200
From: Ulf Samuelsson <meta-ti@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@yoctoproject.org
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
In-Reply-To: <7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
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
X-List-Received-Date: Sat, 07 Jun 2014 07:56:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


2014-06-07 00:38, Denys Dmytriyenko skrev:
> On June 6, 2014 5:58:21 PM EDT, Ulf Samuelsson <meta-ti@emagii.com> wrote:
>> Anyone succeded with this?
>>
>> Which version of Yocto (dora/daisy?)
>>
>> Which kernel
>>
>> Any extra patches needed?
>>
>> Any image recipe which can be shared?
>>
>> BR
>> Ulf Samuelsson
> I have the necessary recipes and images in meta-arago. And you'd obviously need meta-qt5. Do you need any specific features out of it?
>
Could you send me your

* local.conf
* bblayers.conf

  for building qt5?

BR
Ulf



