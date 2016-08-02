Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79D3FE0113F; Mon,  1 Aug 2016 19:19:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 409 seconds by postgrey-1.32 at yocto-www;
	Mon, 01 Aug 2016 19:19:10 PDT
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34C0CE00F35
	for <meta-ti@yoctoproject.org>; Mon,  1 Aug 2016 19:19:10 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 2DCDA68A01A; Tue,  2 Aug 2016 03:12:20 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 7CF7168A019;
	Tue,  2 Aug 2016 03:12:19 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 3BFC5674043E;
	Tue,  2 Aug 2016 04:12:19 +0200 (CEST)
To: meta-ti@yoctoproject.org
References: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
	<20160801233449.GI3677@edge>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <fe415fd4-f9c9-faa7-61aa-d0e33d26ac78@mlbassoc.com>
Date: Tue, 2 Aug 2016 04:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160801233449.GI3677@edge>
Subject: Re: Getting started with meta-ti (beaglebone)
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
X-List-Received-Date: Tue, 02 Aug 2016 02:19:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-02 01:34, Denys Dmytriyenko wrote:
> On Mon, Aug 01, 2016 at 03:49:37PM -0700, Manjukumar Harthikote Matha wrote:
>> All,
>>
>> I am trying to build for beaglebone but facing some errors on master
>> branch. Maybe I am missing some configuration for the builds, can
>> you please help me out
>>
>> I cloned, poky, meta-openembedded and meta-ti master branch
>>
>> source oe-init-build-env beaglebone
>>
>> Added BBMASK = "meta-ti/recipes-misc" in local.conf
>
> What's this ^^^ for?
>
>
>> MACHINE=beaglebone bitbake core-image-minimal
>>
>> Gives me an error
>
> Are those Python3 related errors?
>
>
>> ERROR: Unable to parse /workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
>> Traceback (most recent call last):
>>   File
>> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py",
>> line 151, in SignatureGeneratorOEBasicHash.finalise(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb',
>> d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>, variant=None):
>>              try:
>>     >            taskdeps = self._build_data(fn, d)
>>              except:
>>   File
>> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py",
>> line 104, in SignatureGeneratorOEBasicHash._build_data(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb',
>> d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>):
>>
>>     >        tasklist, gendeps, lookupcache =
>> bb.data.generate_dependencies(d)
>>
>>   File
>> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/data.py",
>> line 438, in generate_dependencies(d=<bb.data_smart.DataSmart object
>> at 0x7fd9cd6f1b38>):
>>                      if dep not in deps:
>>     >                    deps[dep], values[dep] =
>> build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
>>                      newdeps |=  deps[dep]
>>
>> ....
>> ....
>> ='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc'):
>>              code = compile(check_indent(str(node)), filename, "exec",
>>     >                       ast.PyCF_ONLY_AST)
>>
>>   File "/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc",
>> line 51
>>     os.chmod(binfile, 0755)
>>                          ^
>> SyntaxError: invalid token

In python3 this needs to be 0o755

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

