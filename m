Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37A8CE0074F
	for <meta-ti@yoctoproject.org>; Tue, 26 Nov 2013 01:48:01 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAQ9m00K003250
	for <meta-ti@yoctoproject.org>; Tue, 26 Nov 2013 03:48:00 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAQ9m0oF004662
	for <meta-ti@yoctoproject.org>; Tue, 26 Nov 2013 03:48:00 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 26 Nov 2013 03:47:59 -0600
Received: from [172.24.0.4] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAQ9lucf023429;
	Tue, 26 Nov 2013 03:47:57 -0600
Message-ID: <52946E4B.7040103@ti.com>
Date: Tue, 26 Nov 2013 15:17:55 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <20131120110538.GA22903@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
	<20131120151843.GB29952@edge>
	<1C8E0AB07841D94E95FFFB7FCFE26FE00C7D2D14@DFLE10.ent.ti.com>
	<20131121234058.GT29952@edge>
In-Reply-To: <20131121234058.GT29952@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH] ipc: IPC for communication between multiple processors
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
X-List-Received-Date: Tue, 26 Nov 2013 09:48:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/22/2013 5:10 AM, Denys Dmytriyenko wrote:
> On Thu, Nov 21, 2013 at 06:38:55PM -0500, Ring, Chris wrote:
>> Below...
>>
>>> -----Original Message-----
>>> From: Dmytriyenko, Denys
>>> Sent: Wednesday, November 20, 2013 7:19 AM
>>> To: Maupin, Chase
>>> Cc: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org; Ring, Chris; Nelson,
>>> Sam
>>> Subject: Re: [meta-ti] [PATCH] ipc: IPC for communication between multiple
>>> processors
>>>
>>> See my comments below.
>>>
>>> <chop>
>>>
>>>>> +
>>>>> +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>>>> +---
>>>>> + ipc-linux.mak |    1 +
>>>>> + products.mak  |    1 +
>>>>> + 2 files changed, 2 insertions(+)
>>>>> +
>>>>> +diff --git a/ipc-linux.mak b/ipc-linux.mak
>>>>> +index 788a5a2..01579e4 100644
>>>>> +--- a/ipc-linux.mak
>>>>> ++++ b/ipc-linux.mak
>>>>> +@@ -38,6 +38,7 @@ include products.mak
>>>>> + config:
>>>>> + 	@echo "Configuring Linux Ipc ..."
>>>>> + 	./configure --host=$(TOOLCHAIN_LONGNAME) \
>>>>> ++            --prefix=$(PREFIX) \
>>>>> +             CC=$(TOOLCHAIN_PREFIX)gcc \
>>>>> +             PLATFORM=$(PLATFORM) \
>>>>> +             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
>>>> This line makes me think there is a dependency missing.  In the past
>>>> something like ti-paths.inc would pass this value along.  I'm not saying
>>>> that should be replicated as is, but likely you want to se this to
>>>> STAGING_DIR_TARGET or something similar and the cmem recipe should stage
>>>> appropriately.
>>>>
>>>> I think it would be good if you walked through your software stack to
>>> make
>>>> sure you are sending your patches in order.  Likewise, there was some
>>>> discussion with Sam about cmem recipes and basically about aligning
>>> recipes
>>>> between your groups.  I thin the approach of breaking linux-utils up
>>> into a
>>>> recipe per component is going to be the cleanest approach.  I'll ping on
>>>> Sam's patches as well to get an update posted to meta-ti instead of
>>>> meta-arago list.
>>>>
>>>> Any pointers you can provide to documentation about the configuration
>>> and
>>>> building of these components you are pushing up would also be useful to
>>> help
>>>> in reviewing so we can understand what you are trying to accomplish.
>>> Nice catch. The first question - does it depend and require cmem?
>> The IPC build, including required variables, is described here:
>>     http://processors.wiki.ti.com/index.php/IPC_Install_Guide_Linux
>>
>> CMEM_INSTALL_DIR is only required if you want to build the examples which 
>> leverage CMEM.  It shouldn't be needed if you only want to build the IPC 
>> libraries.
> Thanks, Chris!
>
> Sam, Mrinmayee, can you comment on whether you need IPC examples and/or pass 
> CMEM_INSTALL_DIR. Thanks.
We do not need o build the IPC examples at this point. Hence we are not
passing the CMEM_INSTALL_DIR variable

>


-- 
Regards,
Mrinmayee


