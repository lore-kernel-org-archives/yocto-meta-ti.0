Return-Path: <tim.bird@am.sony.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe001.messaging.microsoft.com [216.32.180.184])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AFE1E003D6
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 13:48:06 -0700 (PDT)
Received: from mail116-co1-R.bigfish.com (10.243.78.226) by
	CO1EHSOBE008.bigfish.com (10.243.66.71) with Microsoft SMTP Server id
	14.1.225.23; Thu, 18 Oct 2012 20:48:05 +0000
Received: from mail116-co1 (localhost [127.0.0.1])	by
	mail116-co1-R.bigfish.com (Postfix) with ESMTP id C5931160286;
	Thu, 18 Oct 2012 20:48:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:160.33.194.229; KIP:(null); UIP:(null);
	IPV:NLI; H:usculsndmail02v.am.sony.com; RD:mail02.sonyusa.com;
	EFVD:NLI
X-SpamScore: -5
X-BigFish: VPS-5(zzbb2dI98dI9371I1432I1447Izz1202h1d1ah1d2ahzz8275dhz2fh2a8h668h839h93fhd25hf0ah107ah1288h12a5h12a9h12bdh137ah13b6h1441h1155h)
Received-SPF: pass (mail116-co1: domain of am.sony.com designates
	160.33.194.229 as permitted sender) client-ip=160.33.194.229;
	envelope-from=tim.bird@am.sony.com;
	helo=usculsndmail02v.am.sony.com ; .am.sony.com ; 
Received: from mail116-co1 (localhost.localdomain [127.0.0.1]) by mail116-co1
	(MessageSwitch) id 1350593283259813_13361;
	Thu, 18 Oct 2012 20:48:03 +0000 (UTC)
Received: from CO1EHSMHS011.bigfish.com (unknown [10.243.78.233])	by
	mail116-co1.bigfish.com (Postfix) with ESMTP id 33506540091;
	Thu, 18 Oct 2012 20:48:03 +0000 (UTC)
Received: from usculsndmail02v.am.sony.com (160.33.194.229) by
	CO1EHSMHS011.bigfish.com (10.243.66.21) with Microsoft SMTP Server
	(TLS) id 14.1.225.23; Thu, 18 Oct 2012 20:48:01 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com
	[146.215.230.103])	by usculsndmail02v.am.sony.com
	(Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with ESMTP id q9IKm0Vl020598;
	Thu, 18 Oct 2012 20:48:00 GMT
Received: from mail1x.sgo.in.sel.sony.com (mail.sgo.in.sel.sony.com
	[43.130.1.112])	by usculsndmail12v.am.sony.com
	(Sentrion-MTA-4.2.2/Sentrion-MTA-4.2.2) with ESMTP id q9IKlxRm008537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Oct 2012 20:48:00 GMT
Received: from [43.135.148.222] ([43.135.148.222])	by
	mail1x.sgo.in.sel.sony.com (Switch-3.4.2/Switch-3.4.2) with ESMTP id
	q9IKlwCE017296;	Thu, 18 Oct 2012 20:47:58 GMT
Message-ID: <50806AFE.90900@am.sony.com>
Date: Thu, 18 Oct 2012 13:47:58 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <508064FA.5050701@am.sony.com> <20121018203413.GA25196@denix.org>
In-Reply-To: <20121018203413.GA25196@denix.org>
X-OriginatorOrg: am.sony.com
X-Mailman-Approved-At: Thu, 18 Oct 2012 13:51:50 -0700
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Dependency on packagegroup??
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
X-List-Received-Date: Thu, 18 Oct 2012 20:48:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 10/18/2012 01:34 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 18, 2012 at 01:22:18PM -0700, Tim Bird wrote:
>> I'm just getting started using the meta-ti layer, and
>> on my first build for a MACHINE="pandaboard", I got this error:
>>
>> $ bitbake core-image-minimal
>> ERROR: ParseError at /a/home/tbird/work/yocto/meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb:5: Could not inherit file classes/packagegroup.bbclass
>> ERROR: Command execution failed: Exited with 1
>>
>> Summary: There was 1 WARNING message shown.
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>>
>> I have my BBMASK set to "meta-ti/recipes-misc"
>>
>> The README says that the layer depends on
>> git://git.openembedded.org/openembedded-core
>>
>> In looking at the dependency on packagegroups, it looks like this is only referenced in
>> meta-ti/recipes-ti/packagegroup/packagegroup-ti-test.bb
>>
>> If I'm not interested (currently) in the test packages, can I just remove or
>> rename packagegroup-ti-test.bb, or add it to BBMASK,
>> rather than install the openembedded-core layer?
>>
>> Will this break anything?
>>
>> I'd like to keep my setup as minimal as possible.
> 
> Hi, Tim,
> 
> I think you are mixing branches and versions here. As "packagegroup" is what 
> "task" has been renamed to in the latest OE-Core (Yocto/Poky whichever you 
> use) - that's in the master branch. Looks like you are using either a 
> "denzil" branch of OE-Core or a previous release of Yocto/Poky and mixing it 
> with the "master" branch of meta-ti. If "denzil" is what you need, please use 
> the corresponding branch in meta-ti, as "master" of meta-ti follows the same 
> in OE-Core.

Looks like that was it.  I was indeed mixed up in my branches and versions!
It's building now.

Thanks for the quick help!
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================


