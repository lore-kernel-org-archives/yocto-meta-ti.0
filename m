Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4C04E00786; Wed, 24 Sep 2014 02:37:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0777E0034C
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 02:37:33 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8O9bVPD008008
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 04:37:32 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8O9bEPi005761
	for <meta-ti@yoctoproject.org>; Wed, 24 Sep 2014 15:07:15 +0530
Received: from [172.24.159.120] (172.24.159.120) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 24 Sep 2014 15:07:13 +0530
Message-ID: <542290C8.3040102@ti.com>
Date: Wed, 24 Sep 2014 15:07:12 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-7-git-send-email-a0393906@ti.com>
	<20140923162254.GS6303@edge> <20140923180559.GT6303@edge>
In-Reply-To: <20140923180559.GT6303@edge>
X-Originating-IP: [172.24.159.120]
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 6/6] libdrm: do_install_append added for modetest
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
X-List-Received-Date: Wed, 24 Sep 2014 09:37:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

On 23-Sep-14 11:35 PM, Denys Dmytriyenko wrote:
> Doesn't this work?
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch#n43


Yes, it works. The patch that I submitted was not required.
I had not looked at this patch earlier.

Thanks for pointing me to this.

>
>
> On Tue, Sep 23, 2014 at 12:22:54PM -0400, Denys Dmytriyenko wrote:
>> I was pretty sure installtests-ti.patch was supposed to take care of that...
>>
>>
>> On Tue, Sep 23, 2014 at 09:30:36PM +0530, Karthik Ramanan wrote:
>>> * modetest is a very important application to test the drm
>>>    interface, this is not installed by the default make install.
>>>
>>> * It is desirable to have this binary on the target because it
>>>    allows all kinds of basic debugging.
>>>
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> ---
>>>   recipes-graphics/drm/libdrm_2.4.41.bb |    8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
>>> index 0150632..d94dca1 100644
>>> --- a/recipes-graphics/drm/libdrm_2.4.41.bb
>>> +++ b/recipes-graphics/drm/libdrm_2.4.41.bb
>>> @@ -15,6 +15,12 @@ SRC_URI += "file://installtests-ti.patch \
>>>               file://GNU_SOURCE_definition.patch \
>>>              "
>>>
>>> -PR = "${INC_PR}.1"
>>> +PR = "${INC_PR}.2"
>>>
>>>   S = "${WORKDIR}/git"
>>> +
>>> +do_install_append() {
>>> +        mkdir -p ${D}/usr/bin/
>>> +        cp ${S}/tests/modetest/.libs/modetest ${D}/usr/bin
>>> +}
>>> +
>>> --
>>> 1.7.9.5
>>>
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


