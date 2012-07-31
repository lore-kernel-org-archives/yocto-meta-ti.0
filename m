Return-Path: <Vladimir_Zapolskiy@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B5ACE00288
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 00:34:42 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Sw6yX-0003ek-EH from Vladimir_Zapolskiy@mentor.com ;
	Tue, 31 Jul 2012 00:34:41 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 31 Jul 2012 00:34:27 -0700
Received: from [172.30.2.207] (137.202.0.76) by SVR-IES-FEM-01.mgc.mentorg.com
	(137.202.0.104) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Tue, 31 Jul 2012 08:34:25 +0100
Message-ID: <50178A7B.5030800@mentor.com>
Date: Tue, 31 Jul 2012 10:34:19 +0300
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1343126062-26998-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<5016E705.7040806@mentor.com> <20120730221049.GB23003@edge>
In-Reply-To: <20120730221049.GB23003@edge>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 31 Jul 2012 07:34:27.0739 (UTC)
	FILETIME=[EA6546B0:01CD6EEE]
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] linux-omap-psp 2.6.32: fix am37x-evm failing build
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
X-List-Received-Date: Tue, 31 Jul 2012 07:34:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

On 31.07.2012 01:10, Denys Dmytriyenko wrote:
> On Mon, Jul 30, 2012 at 10:56:53PM +0300, Vladimir Zapolskiy wrote:
>> Hi,
>>
>> any comments about the issue? Should I firstly create a bug in
>> http://bugzilla.yoctoproject.org, if I want to fix the problem?
>
> I would rather try updating it to 2.6.37 - hopefully that one doesn't have
> this issue with recent binutils... Do you have any specific requirements to
> stay with 2.6.32 instead? If not, 2.6.37 is what is being released as part of
> SDK for AM37x EVM - I'll look into porting it into meta-ti...

thank you in advance. There is no objection from my side about such upgrade.
And you're right, linux-omapl138-psp-2.6.37 doesn't contain similar 
problematic
patches, which should be fixed or removed.

With best wishes,
Vladimir

